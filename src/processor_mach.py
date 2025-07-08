import numpy as np
import threading
from PyQt5.QtCore import QObject, pyqtSignal, pyqtSlot
import logging

logger = logging.getLogger("Processor")
logger.setLevel(logging.DEBUG)
ch = logging.StreamHandler()
formatter = logging.Formatter("[%(name)s] %(message)s")
ch.setFormatter(formatter)
logger.addHandler(ch)


class SignalProcessor(QObject):
    # === 对外信号 ===
    signal_fft_ready = pyqtSignal(np.ndarray, np.ndarray)          # 单频频谱
    signal_sweep_ready = pyqtSignal(np.ndarray, np.ndarray)        # 扫频频谱
    signal_constellation_ready = pyqtSignal(np.ndarray)            # 星座图
    signal_iq_ready = pyqtSignal(np.ndarray, np.ndarray)           # I路, Q路

    def __init__(self):
        super().__init__()
        self.running = False
        self.thread = None

        # 默认扫频参数（可由 UI 调整）
        self.sweep_start = 1e9
        self.sweep_stop = 2.7e9
        self.sweep_points = 10
        self._reset_sweep_buffers()

        self._pending_config = None  # 等待扫频结束时应用的新配置

    def _reset_sweep_buffers(self):
        self.sweep_freqs = [None] * self.sweep_points
        self.sweep_mags = [None] * self.sweep_points
        self.current_step = 0

    def start(self):
        if self.running:
            return
        self.running = True
        self.thread = threading.Thread(target=self._process_loop, daemon=True)
        self.thread.start()

    def update_sweep_config(self, start_freq: float, stop_freq: float, num_points: int):
        """
        可由 UI 调用，更新扫频设置，等下一轮扫频结束后生效。
        """
        self._pending_config = (start_freq, stop_freq, num_points)

    @pyqtSlot(float, float, bytes)
    def process_frame(self, sample_freq: float, lo_freq_hz: float, frame_bytes: bytes):
        """
        总入口：每收到一帧，先解码 IQ，再分发给各子模块。
        """
        try:
            complex_iq = self._decode_iq_from_bytes(frame_bytes)
        except Exception as e:
            logger.warning(f"IQ decode failed: {e}")
            return

        # === 无需 FFT 的分发 ===
        self.signal_constellation_ready.emit(complex_iq)
        self.signal_iq_ready.emit(complex_iq.real, complex_iq.imag)

        # === 计算 FFT ===
        fft_result = np.fft.fftshift(np.fft.fft(complex_iq))
        magnitude = 20 * np.log10(np.abs(fft_result) + 1e-6)
        freqs = np.linspace(-sample_freq / 2, sample_freq / 2, len(magnitude)) + lo_freq_hz

        # === 单频频谱发射 ===
        self.signal_fft_ready.emit(freqs, magnitude)

        # === 扫频逻辑 ===
        self._update_sweep(freqs, magnitude, lo_freq_hz)

    def _update_sweep(self, freqs: np.ndarray, mag: np.ndarray, lo_freq: float):
        """
        每帧处理完后更新 sweep buffer。当前 step 为内部自动维护。
        """
        if self.current_step < self.sweep_points:
            self.sweep_freqs[self.current_step] = freqs
            self.sweep_mags[self.current_step] = mag
            self.current_step += 1

        if self.current_step >= self.sweep_points:
            full_freq = np.concatenate(self.sweep_freqs)
            full_mag = np.concatenate(self.sweep_mags)
            self.signal_sweep_ready.emit(full_freq, full_mag)
            logger.debug("Sweep done. Emitted full sweep spectrum.")

            # 重置状态
            self.current_step = 0

            # 应用 UI 的新配置
            if self._pending_config:
                self.sweep_start, self.sweep_stop, self.sweep_points = self._pending_config
                self._reset_sweep_buffers()
                logger.info(f"Sweep config updated: {self.sweep_start/1e6}-{self.sweep_stop/1e6} MHz / {self.sweep_points} pts")
                self._pending_config = None

    def _decode_iq_from_bytes(self, data_bytes: bytes) -> np.ndarray:
        """
        解码 IQ：每 4 字节一个 IQ 点，I0 I1 Q0 Q1。
        nibble 权重为 [256, 4096, 1, 16]。
        """
        data = np.frombuffer(data_bytes, dtype=np.uint8)
        if len(data) % 4 != 0:
            raise ValueError("数据长度必须是 4 的倍数")

        data = data.reshape(-1, 4)

        def decode_pairs(byte_pair: np.ndarray) -> np.ndarray:
            b0 = byte_pair[:, 0].astype(np.uint8)
            b1 = byte_pair[:, 1].astype(np.uint8)

            n0 = ((b0 & 0xF0) >> 4).astype(np.int32)
            n1 = (b0 & 0x0F).astype(np.int32)
            n2 = ((b1 & 0xF0) >> 4).astype(np.int32)
            n3 = (b1 & 0x0F).astype(np.int32)

            val = n0 * 256 + n1 * 4096 + n2 * 1 + n3 * 16
            val[val >= 32768] -= 65536
            return val.astype(np.float32)

        I = decode_pairs(data[:, 0:2])
        Q = decode_pairs(data[:, 2:4])
        return I + 1j * Q

    def _process_loop(self):
        """
        占位后台线程（如未来扩展实时采样等）。
        """
        while self.running:
            pass  # 当前由外部驱动 process_frame

