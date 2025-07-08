import numpy as np
import pyqtgraph as pg

class FigureManager:
    def __init__(self, ui):
        self.ui = ui  # Ui_MainWindow 实例
        
        # === 初始化图像 ===
        self._init_spectrum()
        self._init_sweep_spectrum()  # ✅ 增加扫频图初始化
        self._init_constellation()
        self._init_iq()
    
    def _init_spectrum(self):
        self.spectrum_curve = self.ui.plt_spectrum.plot(pen='y')
        self.ui.plt_spectrum.setLabel('left', '幅度', units='dB')
        self.ui.plt_spectrum.setLabel('bottom', '频率', units='Hz')
        self.ui.plt_spectrum.showGrid(x=True, y=True)

    def _init_sweep_spectrum(self):  # ✅ 新增方法
        self.sweep_curve = self.ui.plt_sweep_spectrum.plot(pen='g')
        self.ui.plt_sweep_spectrum.setLabel('left', '幅度', units='dB')
        self.ui.plt_sweep_spectrum.setLabel('bottom', '频率', units='Hz')
        self.ui.plt_sweep_spectrum.showGrid(x=True, y=True)

    def _init_constellation(self):
        self.constellation_curve = self.ui.plt_cstl.plot(pen=None, symbol='o', symbolSize=3, symbolBrush='c')
        self.ui.plt_cstl.setLabel('left', 'Q')
        self.ui.plt_cstl.setLabel('bottom', 'I')
        self.ui.plt_cstl.showGrid(x=True, y=True)

    def _init_iq(self):
        self.i_curve = self.ui.plt_I.plot(pen='r')
        self.q_curve = self.ui.plt_Q.plot(pen='b')
        self.ui.plt_I.setLabel('left', '幅度')
        self.ui.plt_I.setLabel('bottom', '样本')
        self.ui.plt_Q.setLabel('left', '幅度')
        self.ui.plt_Q.setLabel('bottom', '样本')

    # === 更新函数 ===
    def update_spectrum(self, freqs: np.ndarray, values: np.ndarray):
        self.spectrum_curve.setData(freqs, values)

    def update_constellation(self, iq: np.ndarray):
        self.constellation_curve.setData(iq.real, iq.imag)

    def update_iq(self, i_data: np.ndarray, q_data: np.ndarray):
        self.i_curve.setData(i_data)
        self.q_curve.setData(q_data)

    def update_sweep_spectrum(self, freqs: np.ndarray, values: np.ndarray):  # ✅ 新增接口
        self.sweep_curve.setData(freqs, values)
