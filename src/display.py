# display.py
import pyqtgraph as pg
from PyQt5.QtWidgets import QWidget, QVBoxLayout, QPushButton, QLabel
from PyQt5.QtCore import Qt
from PyQt5.QtWidgets import QApplication
import numpy as np
import logging

logger = logging.getLogger("Display")
logger.setLevel(logging.DEBUG)
ch = logging.StreamHandler()
formatter = logging.Formatter("[%(name)s] %(message)s")
ch.setFormatter(formatter)
logger.addHandler(ch)

# 这个类只更新 UI, 且提供更新 Widget 状态的方法, 但是不对外界的其他状态做检查 (那是 Controller 的职责)

class SpectrumDisplay(QWidget):
    def __init__(self, parent=None, fft_size=1024, sample_rate=1_000_000):
        super().__init__(parent)
        self.fft_size = fft_size
        self.sample_rate = sample_rate

        # 构建绘图窗口
        self.plot_widget = pg.PlotWidget(title="频谱显示")
        self.plot_widget.setLabel('bottom', '频率', units='Hz')
        self.plot_widget.setLabel('left', '幅度', units='dB')
        self.plot_widget.showGrid(x=True, y=True)
        self.plot_widget.setMouseEnabled(x=False, y=False)
        # self.plot_widget.setYRange(-100, 0)
        self.plot_widget.enableAutoRange(axis='y')

        self.label_status = QLabel("未连接")
        self.btn_start = QPushButton("开始")
        self.btn_start.setEnabled(False)

        layout = QVBoxLayout()
        layout.addWidget(self.plot_widget)
        layout.addWidget(self.label_status)
        layout.addWidget(self.btn_start)
        self.setLayout(layout)

        # 明确创建 PlotDataItem（避免 plot() 自动行为）
        self.curve = pg.PlotDataItem(pen=pg.mkPen(color='y', width=1))
        self.plot_widget.addItem(self.curve)

        # 构造频率轴
        self.freq_axis = np.linspace(-self.sample_rate / 2, self.sample_rate / 2, self.fft_size, endpoint=False)
        self.plot_widget.setXRange(self.freq_axis[0], self.freq_axis[-1])

    def try_enable_start(self, is_connected):
        if is_connected:
            logger.debug("Enabling start...")
            self.label_status.setText("已连接")
            self.btn_start.setEnabled(True)
            return

        logger.debug("client_connected was signaled but there's no valid connection.")


    def update_spectrum(self, magnitude_array):
        if magnitude_array.shape[0] != self.fft_size:
            logger.debug(f"Skipped frame: expected {self.fft_size} points, got {magnitude_array.shape[0]}")
            return

        if not np.all(np.isfinite(magnitude_array)):
            logger.warning("Non-finite values in spectrum data — skipping.")
            return

        magnitude_array = magnitude_array.astype(np.float32)
        self.curve.setData(self.freq_axis, magnitude_array)

        # 可选：强制 GUI 刷新
        self.plot_widget.repaint()
        QApplication.processEvents()

        logger.debug("Spectrum updated")
        logger.debug(f"max={magnitude_array.max():.2f}, min={magnitude_array.min():.2f}")
