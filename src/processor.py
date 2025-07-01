# processor.py
import numpy as np
import threading
from PyQt5.QtCore import QObject, pyqtSignal
import logging
logger = logging.getLogger("Processor")
logger.setLevel(logging.DEBUG)
ch = logging.StreamHandler()
formatter = logging.Formatter("[%(name)s] %(message)s")
ch.setFormatter(formatter)
logger.addHandler(ch)


class SignalProcessor(QObject):
    signal_fft_ready = pyqtSignal(np.ndarray)  # 发出处理后的频谱数据（幅度谱）

    def __init__(self, buffer, sample_rate=1_000_000):
        super().__init__()
        self.buffer = buffer
        self.sample_rate = sample_rate
        self.running = False
        self.thread = None

    def start(self):
        if self.running:
            return
        self.running = True
        self.thread = threading.Thread(target=self._process_loop, daemon=True)
        self.thread.start()

    def stop(self):
        self.running = False

    def _process_loop(self):
        while self.running:
            frame = self.buffer.pop()
            if frame:
                fft_mag = self.process_frame(frame)
                self.signal_fft_ready.emit(fft_mag)

    def process_frame(self, frame_bytes):
        """
        将原始 2048 字节帧转换为 IQ 数据并做 FFT，输出频谱（幅度谱）
        假设每个 I/Q 点 2 字节，交错排列
        """
        raw = np.frombuffer(frame_bytes, dtype=np.int8) # frame byte 是否为无符号数？-> 直流偏置

        i_data = raw[0::2]
        q_data = raw[1::2]
        complex_iq = i_data + 1j * q_data

        fft_result = np.fft.fftshift(np.fft.fft(complex_iq))

        magnitude = 20 * np.log10(np.abs(fft_result) + 1e-6)  # dB 级别
        logger.debug(f"mag_max = {max(magnitude)}, mag_min={min(magnitude)}")

        return magnitude
