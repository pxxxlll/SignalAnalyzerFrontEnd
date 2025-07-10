from PyQt5.QtWidgets import QMainWindow, QApplication, QMessageBox
from PyQt5 import uic
from PyQt5.QtCore import Qt, pyqtSignal, pyqtSlot, QSemaphore
from ui.analyzer import Ui_MainWindow  
import pyqtgraph as pg
import sys
import numpy as np
from figure_manager import FigureManager  # 导入图像管理器
import re
from freq_utils import SweepConfig  # 导入扫频配置类

import logging
logging.basicConfig(level=logging.DEBUG)
logger = logging.getLogger("Analyzer")


from functools import wraps
def update_wrapper(func):
    """
    装饰器：自动释放 UI 信号量
    """
    @wraps(func)
    def wrapper(self, *args, **kwargs):
        logger.debug(f"Calling {func.__name__}")
        result = func(self, *args, **kwargs)
        self._any_update_done()
        return result
    return wrapper


class MainWindow(QMainWindow, Ui_MainWindow):

    signal_try_conn = pyqtSignal()
    signal_try_off = pyqtSignal()

    signal_ui_all_updated = pyqtSignal()
    signal_set_sweep_config = pyqtSignal(SweepConfig)  # 发射扫频配置信号

    def __init__(self):
        super().__init__()


        self.setupUi(self)
        self.figures = FigureManager(self)  # 把 self 传进去以访问 ui 对象
        self.update_done_sema = QSemaphore(0) # 用于给 Controller 申请
        self.total_expected_updates = 10 

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
    
    def _any_update_done(self):
        """
        检查是否所有更新都已完成。
        """
        self.update_done_sema.release(1)

    def wait_for_ui_update(self):
        """
        等待所有更新完成。
        """
        logger.debug("Waiting for all UI updates to complete...")
        logger.debug(f"Total expected updates: {self.total_expected_updates}")
        logger.debug(f"Current semaphore count: {self.update_done_sema.available()}")
        logger.debug("Waiting for semaphore to release...")
        self.update_done_sema.acquire(self.total_expected_updates)
        logger.debug("All UI updates completed.")
        self.signal_ui_all_updated.emit()  # 发射信号，表示所有更新已完成

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
    @update_wrapper
    def update_spectrum(self, freqs: np.ndarray, values: np.ndarray):
        self.figures.update_spectrum(freqs, values)
        # logger.debug("Calling update_spectrum")
        # self._any_update_done()  # 释放信号量，表示更新已完成

    @pyqtSlot(np.ndarray)
    @update_wrapper
    def update_constellation(self, iq: np.ndarray): 
        """
        更新星座图。
        :param iq: 复数数组，形状为 (N, )，表示 I/Q 数据
        """
        self.figures.update_constellation(iq)
        # logger.debug("Calling update_constellation")
        # self._any_update_done()  # 释放信号量，表示更新已完成
    

    @pyqtSlot(np.ndarray, np.ndarray)
    @update_wrapper
    def update_iq(self, i_data: np.ndarray, q_data: np.ndarray):
        """
        更新 I/Q 图。
        :param i_data: I 数据数组
        :param q_data: Q 数据数组
        """
        logger.debug(f"Updating I/Q data: {len(i_data)} samples")
        self.figures.update_iq(i_data, q_data)
        # logger.debug("Calling update_iq")
        # self._any_update_done()  # 释放信号量，表示更新已完成

    @pyqtSlot(np.ndarray, np.ndarray)
    @update_wrapper
    def update_sweep_spectrum(self, freqs: np.ndarray, values: np.ndarray):
        """
        更新扫频图。
        :param freqs: 频率数组
        :param values: 幅度数组
        """
        self.figures.update_sweep_spectrum(freqs, values)   
        # logger.debug("Calling update_sweep_spectrum")
        # self._any_update_done()  # 释放信号量，表示更新已完成

    @pyqtSlot(np.ndarray, np.ndarray)
    @update_wrapper
    def update_s21(self, s21_x, s21_y):
        """
        更新 S21 图。
        :param s21_x: 频率数组
        :param s21_y: 幅度数组
        """
        self.figures.update_s21(s21_x, s21_y)
        # logger.debug("Calling update_s21")
        # self._any_update_done()  # 释放信号量，表示更新已完成

    @pyqtSlot(str)
    @update_wrapper
    def update_curr_freq(self, curr_freq: str):
        """
        更新当前频率显示。
        :param cur_freq: 当前频率字符串
        """
        curr_freq = "当前频率 (MHz):\n" + curr_freq
        self.txt_curr_freq.setText(curr_freq)
        # logger.debug("Calling update_cur_freq")
        # self._any_update_done()  # 释放信号量，表示更新已完成
    
    @pyqtSlot(str)
    @update_wrapper
    def update_evm(self, evm: str):
        """
        更新 EVM 显示。
        :param evm: EVM 字符串
        """
        evm = "EVM (%):\n" + evm
        self.txt_evm.setText(evm)

    @pyqtSlot(str)
    @update_wrapper
    def update_imb_a(self, imb_a: str):
        """
        更新 I/Q 不平衡幅度。
        :param imb_a: 幅度字符串
        """
        imb_a = "幅度不平衡 (dB):\n" + imb_a
        self.txt_imb_a.setText(imb_a)

    @pyqtSlot(str)
    @update_wrapper
    def update_imb_p(self, imb_p: str):
        """
        更新 I/Q 不平衡相位。
        :param imb_p: 相位字符串
        """
        imb_p = "相位不平衡 (°):\n" + imb_p
        self.txt_imb_p.setText(imb_p)

    @pyqtSlot(str)
    @update_wrapper
    def update_mod_type(self, mod_type: str):
        """
        更新调制类型显示。
        :param mod_type: 调制类型字符串
        """
        mod_type = "调制类型:\n" + mod_type
        self.txt_mod_type.setText(mod_type) 



    @pyqtSlot()
    def on_btn_set_freq_clicked(self):
        try:
            # 原始输入文本
            low_text = self.txt_set_freq_low.toPlainText()
            high_text = self.txt_set_freq_high.toPlainText()
            pts_text = self.txt_set_freq_pts.toPlainText()

            # 使用正则提取第一个浮点数（支持小数）
            def extract_number(text, default=None):
                match = re.search(r"[-+]?\d*\.?\d+", text)
                return float(match.group()) if match else default

            f_low = extract_number(low_text)
            f_high = extract_number(high_text)
            points = int(extract_number(pts_text))

            if f_low is None or f_high is None or points is None:
                raise ValueError("无法解析全部输入内容")

            # 转换为 Hz 单位
            f_low *= 1e9
            f_high *= 1e9

            if f_low >= f_high:
                raise ValueError("起始频率必须小于终止频率")
            if points < 2:
                raise ValueError("点数必须大于等于 2")

            print(f"设置频率范围: {f_low/1e9:.2f} GHz - {f_high/1e9:.2f} GHz，共 {points} 点")
            config = SweepConfig(f_low, f_high, points)
            self.signal_set_sweep_config.emit(config)  # 发射扫频配置信号

        except Exception as e:
            QMessageBox.critical(self, "输入错误", f"解析失败：{str(e)}")
 


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