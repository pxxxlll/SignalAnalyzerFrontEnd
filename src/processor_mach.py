import numpy as np
# import threading
from PyQt5.QtCore import QObject, pyqtSignal, pyqtSlot
import logging
from freq_utils import SweepConfig

logger = logging.getLogger("Processor")
logger.setLevel(logging.DEBUG)
ch = logging.StreamHandler()
formatter = logging.Formatter("[%(name)s] %(message)s")
ch.setFormatter(formatter)
logger.addHandler(ch)


def rcosdesign(beta, span, sps):
    N = span * sps
    t = np.arange(-N / 2, N / 2 + 1) / sps
    h = np.sinc(t) * np.cos(np.pi * beta * t) / (1 - (2 * beta * t) ** 2)
    h[t == 0.0] = 1.0
    h[np.abs(2 * beta * t) == 1] = np.pi / 4
    h = h / np.sum(h)
    return h


class SignalProcessor(QObject):
    signal_fft_ready = pyqtSignal(np.ndarray, np.ndarray)
    signal_sweep_ready = pyqtSignal(np.ndarray, np.ndarray)
    signal_constellation_ready = pyqtSignal(np.ndarray)
    signal_iq_ready = pyqtSignal(np.ndarray, np.ndarray)
    signal_s21_ready = pyqtSignal(np.ndarray, np.ndarray)

    signal_frame_end = pyqtSignal()

    def __init__(self, sweep_config: SweepConfig, parent=None):
        super().__init__(parent)
        self.sweep_config = sweep_config
        self._sweep_config_version = sweep_config.version()
        self._rrc_filter = rcosdesign(beta=0.35, span=8, sps=8)
        self._reset_sweep_buffers()
        self.running = False
        # self.thread = None
        self.sweep_started = False

    def _reset_sweep_buffers(self):
        self.sweep_mags = []
        # self.current_step = 0
        # self.best_energy = 0.0
        # self.best_iq = None
        # self.prev_lo_freqs = set()
        # self.sweep_started = False
        # logger.debug("Sweep buffers reset.")

    # def start(self):
        # if self.running:
            # return
        # self.running = True
        # self.thread = threading.Thread(target=self._process_loop, daemon=True)
        # self.thread.start()

    @pyqtSlot(float, float, bytes, int)
    def process_frame(self, sample_freq: float, lo_freq_hz: float, frame_bytes: bytes, sweep_step: int):

        # if lo_freq_hz in self.prev_lo_freqs:
            # logger.warning(f"Duplicate LO freq {lo_freq_hz/1e6:.2f} MHz at step {sweep_step}, skipping.")
            # return
        # self.prev_lo_freqs.add(lo_freq_hz)
        # save_payload(frame_bytes, prefix=f"frame_step{sweep_step:02d}_lo_idx{int(lo_freq_hz)}")

        try:
            iq = self._decode_iq_from_bytes(frame_bytes)
        except Exception as e:
            logger.warning(f"IQ decode failed: {e}")
            return

        self.signal_iq_ready.emit(iq.real, iq.imag)


        # === 升采样 + RRC滤波 ===
        rx_up = np.zeros(len(iq) * 2, dtype=np.complex64)
        rx_up[::2] = iq
        rx_interp = np.convolve(rx_up, self._rrc_filter, mode='same')

        # === 星座图：相偏校正（非归一化） ===

        iq_norm = iq / (np.max(np.abs(iq)) + 1e-6)  # 避免溢出，仅用于角度估计
        iq4 = -iq_norm ** 4
        ang = np.angle(np.sum(iq4)) / 4
        iq_corrected = iq * np.exp(-1j * ang)  # 使用原始幅度的 iq 做校正

        threshold = np.max(np.abs(iq_corrected)) * 0.08
        idx = np.where(np.abs(iq_corrected) > threshold)[0]
        idx = idx[5:]  # 去掉前 5 个样点
        IQ_filtered = iq_corrected[idx]
        self.signal_constellation_ready.emit(IQ_filtered)


        # === 频谱分析（使用升采样信号） ===
        fft_len = int(2 ** np.ceil(np.log2(len(rx_interp))))
        rx_fft = 20 * np.log10(np.abs(np.fft.fftshift(np.fft.fft(rx_interp, fft_len))) + 1e-6)
        single_freqs = np.linspace(-sample_freq / 2, sample_freq / 2, len(rx_fft)) + lo_freq_hz
        self.signal_fft_ready.emit(single_freqs, rx_fft)

        # === 更新 sweep 图谱（子频段） ===
        center = fft_len // 2
        side_len = fft_len // 8
        sub_mag = rx_fft[center - side_len:center + side_len]
        sub_mag = np.delete(sub_mag, side_len)

        self.sweep_mags.append(sub_mag.copy())
        # self.current_step += 1

        spectrum_combined = np.concatenate(self.sweep_mags)
        freq_axis = np.linspace(self.sweep_config.start, self.sweep_config.stop, len(spectrum_combined))
        self.signal_sweep_ready.emit(freq_axis, spectrum_combined)

        logger.debug(f"Processed frame: LO = {lo_freq_hz / 1e6:.2f} MHz, "
                    f"Sample Freq = {sample_freq / 1e6:.2f} MHz, "
                    f"Current Step = {sweep_step}, Sweep Points = {self.sweep_config.points}")

        # 参数设置
        f_start = 1e9       # 起始频率：1 GHz
        f_stop = 2e9        # 终止频率：2 GHz
        n_points = 201      # 频点数量

        # 频率轴
        freqs = np.linspace(f_start, f_stop, n_points)

        # 构造一个中心频率为 1.5 GHz 的带通响应
        center_freq = 1.5e9
        bandwidth = 100e6
        s21_db = ((freqs - center_freq) / (bandwidth / 2)) * 20  # 线性下降
        s21_db = np.clip(s21_db, -1, 0)  # 限制最大衰减

        # 添加一些随机噪声
        noise = 1.5 * np.random.normal(0, 0.5, size=freqs.shape)
        s21_db += noise
        self.signal_s21_ready.emit(freqs, s21_db)



        self.signal_frame_end.emit()

        if sweep_step >= self.sweep_config.points - 1:
            self._reset_sweep_buffers()
            # logger.debug(f"Sweep completed at step {sweep_step}, resetting buffers.")



    def _decode_iq_from_bytes(self, data_bytes: bytes) -> np.ndarray:
        if len(data_bytes) % 2 != 0:
            raise ValueError("Invalid IQ byte length")
        data_bytes = np.frombuffer(data_bytes, dtype=np.uint8)

        A = data_bytes.reshape((2, -1), order='F')  # Fortran 顺序等价 MATLAB 列主序
    
        #A = A[:,8:]
        # 偶数列：Q，奇数列：I
        odd_A = A[:, 0::2]   # I 路
        even_A = A[:, 1::2]  # Q 路

        # 展开为行向量
        I_1 = odd_A.flatten(order='F')   # 1行，顺序一致
        Q_1 = even_A.flatten(order='F')

        # 提取高4位和低4位
        def extract_nibbles(arr):
            high = (arr & 0xF0) >> 4
            low = arr & 0x0F
            return high, low

        I_high, I_low = extract_nibbles(I_1)
        Q_high, Q_low = extract_nibbles(Q_1)

        # 组合成 4 行再重排
        
        I_nibbles = np.vstack((I_high, I_low))  # shape: (2, N)
        I_nibbles = I_nibbles.reshape((4, -1), order='F')  # shape: (4, N/2)
        I_parts = I_nibbles[[2, 3, 0, 1], :]  # 按照 3,4,1,2 重排
        I_parts = I_parts.astype(np.uint32)
        I_vals = (I_parts[0] * 4096 +
                I_parts[1] * 256 +
                I_parts[2] * 16 +
                I_parts[3]).astype(np.int32)

        # 补码转换为有符号 int16
        I_vals[I_vals >= 32768] -= 65536

        # Q 通道同样处理
        Q_nibbles = np.vstack((Q_high, Q_low))
        Q_nibbles = Q_nibbles.reshape((4, -1), order='F')
        Q_parts = Q_nibbles[[2, 3, 0, 1], :]
        Q_parts = Q_parts.astype(np.uint32)
        Q_vals = (Q_parts[0] * 4096 +
                Q_parts[1] * 256 +
                Q_parts[2] * 16 +
                Q_parts[3]).astype(np.int32)
        Q_vals[Q_vals >= 32768] -= 65536

        # 返回复数 IQ 数据
        Rx = I_vals.astype(np.float32) + 1j * Q_vals.astype(np.float32)
        return Rx

    # def _process_loop(self):
    #     while self.running:
    #         pass

