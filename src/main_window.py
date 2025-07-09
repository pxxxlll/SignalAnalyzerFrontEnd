from PyQt5.QtWidgets import QMainWindow, QApplication
from PyQt5 import uic
from PyQt5.QtCore import Qt, pyqtSignal, pyqtSlot
from ui.analyzer import Ui_MainWindow  
import pyqtgraph as pg
import sys
import numpy as np
from figure_manager import FigureManager  # 导入图像管理器

import logging
logging.basicConfig(level=logging.DEBUG)
logger = logging.getLogger("Analyzer")

class MainWindow(QMainWindow, Ui_MainWindow):

    signal_try_conn = pyqtSignal()
    signal_try_off = pyqtSignal()

    def __init__(self):
        super().__init__()

        self.setupUi(self)
        self.figures = FigureManager(self)  # 把 self 传进去以访问 ui 对象


        # 设置常量字典
        self.lbl_conn_state_texts = {
            'normal': '未连接',
            'connected': '连接成功',        
            'error': '连接错误'
        }

        self.lbl_conn_light_colors = {
            'normal': [0.5, 0.5, 0.5],  # 灰色（未连接）
            'connected': [0.0, 1.0, 0.0],  # 绿色（连接成功）
            'error': [1.0, 0.0, 0.0]      # 红色（连接错误）
        }

        # 初始化 plt_spectrum 图像
        self.spectrum = self.plt_spectrum.plot(pen='y')  # 黄色线
        self.plt_spectrum.setLabel('left', '幅度', units='dB')
        self.plt_spectrum.setLabel('bottom', '频率', units='Hz')
        self.plt_spectrum.showGrid(x=True, y=True)

        # 初始化连接状态
        self.conn_state_set('normal')  # 初始状态为未连接

        self.btn_conn.clicked.connect(self.on_btn_conn_clicekd)  # 连接按钮点击事件

    @pyqtSlot()
    def on_btn_conn_clicekd(self):
        if self.conn_state != "connected":
            self.signal_try_conn.emit() # 发射连接信号
        else:
            self.signal_try_off.emit() # 发射断开连接信号


    # 信号槽连接：作为lambda函数来连接 TCP 事件
    def conn_state_set(self, state: str):
        """
        设置连接状态。
        """
        if not state in self.lbl_conn_state_texts:
            raise ValueError(f"未知连接状态: {state}")

        logger.debug(f"Setting connection state to: {state}")

        self.conn_state = state # 更新状态
        self.lbl_conn_state.setText(self.lbl_conn_state_texts[state]) # 更新文本
        self.set_lbl_conn_light_color(self.lbl_conn_light_colors[state]) # 更新颜色
        
    def set_lbl_conn_light_color(self, color_normalized):
        r = int(color_normalized[0] * 255)
        g = int(color_normalized[1] * 255)
        b = int(color_normalized[2] * 255)
        color_hex = f"#{r:02x}{g:02x}{b:02x}"

        # 获取原样式，替换背景色，不破坏其他属性
        style = self.lbl_conn_light.styleSheet()
        
        # 尝试替换已有的 background-color 设置
        if "background-color" in style:
            import re
            style = re.sub(r"background-color\s*:\s*[^;]+;", f"background-color: {color_hex};", style)
        else:
            style += f"background-color: {color_hex};"

        self.lbl_conn_light.setStyleSheet(style)

    @pyqtSlot(np.ndarray, np.ndarray)
    def update_spectrum(self, freqs: np.ndarray, values: np.ndarray):
        self.figures.update_spectrum(freqs, values)

    @pyqtSlot(np.ndarray)
    def update_constellation(self, iq: np.ndarray): 
        """
        更新星座图。
        :param iq: 复数数组，形状为 (N, )，表示 I/Q 数据
        """
        self.figures.update_constellation(iq)
    
    @pyqtSlot(np.ndarray, np.ndarray)
    def update_iq(self, i_data: np.ndarray, q_data: np.ndarray):
        """
        更新 I/Q 图。
        :param i_data: I 数据数组
        :param q_data: Q 数据数组
        """
        logger.debug(f"Updating I/Q data: {len(i_data)} samples")
        self.figures.update_iq(i_data, q_data)

    @pyqtSlot(np.ndarray, np.ndarray)
    def update_sweep_spectrum(self, freqs: np.ndarray, values: np.ndarray):
        """
        更新扫频图。
        :param freqs: 频率数组
        :param values: 幅度数组
        """
        self.figures.update_sweep_spectrum(freqs, values)   

    @pyqtSlot(np.ndarray, np.ndarray)
    def update_s21(self, s21_x, s21_y):
        """
        更新 S21 图。
        :param s21_x: 频率数组
        :param s21_y: 幅度数组
        """
        self.figures.update_s21(s21_x, s21_y)

# 运行窗口
if __name__ == "__main__":
    app = QApplication(sys.argv)
    window = MainWindow()
    window.show()

    # 模拟数据更新（1 秒后更新一次）
    import time
    from threading import Timer

    def simulate_data():
        f = np.linspace(0, 1000, 500)
        amp = 20 * np.log10(np.abs(np.sin(2 * np.pi * f / 1000)) + 1e-1)
        window.update_spectrum(f, amp)

    # 延时模拟绘图
    Timer(1.0, simulate_data).start()

    sys.exit(app.exec())