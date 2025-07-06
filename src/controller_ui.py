# controller.py
from PyQt5.QtWidgets import QApplication, QMainWindow, QWidget, QVBoxLayout
from PyQt5.QtCore import QThread, QObject
from receiver import DataReceiver
from main_window import MainWindow
from processor import SignalProcessor
from display import SpectrumDisplay
import logging

logging.basicConfig(level=logging.DEBUG)

class MainController(object):
    def __init__(self):
        super().__init__()

        # 模块初始化
        self.receiver = DataReceiver(port=5000)
        self.display = MainWindow()
        self.display.setWindowTitle("Signal Analyzer")  # 设置窗口标题
        self.thread_processor = QThread()  # 创建处理器线程
        self.thread_processor.setObjectName("ProcessorThread")  # 设置线程名称
        self.processor = SignalProcessor()
        self.processor.moveToThread(self.thread_processor)

        # 信号连接
        self.receiver.signal_data_received.connect(self.processor.process_frame) # 收到数据 -> 处理数据帧
        self.receiver.signal_client_connected.connect(lambda flag: self.display.conn_state_set('connected') if flag
                                                      else self.display.conn_state_set("normal")) # 接收器连接成功 -> 更新前端状态

        self.processor.signal_fft_ready.connect(self.display.update_spectrum) # 处理完成后更新频谱图

        self.display.signal_try_conn.connect(self.receiver.start) # 前端连接请求 -> 启动接收器
        self.display.signal_try_off.connect(self.receiver.stop) # 前端断开请求 -> 停止接收器
        self.display.btn_start.clicked.connect(lambda: self.receiver.send_cmd("start")) # 启动下位机传输
        self.display.btn_stop.clicked.connect(lambda: self.receiver.send_cmd("stop")) # 停止下位机传输

        # 激活模块
        self.thread_processor.start()
        
    def closeEvent(self, event):
        # 程序退出时停止子线程
        self.receiver.stop()
        event.accept()


if __name__ == '__main__':
    import sys
    app = QApplication(sys.argv)
    controller = MainController()
    controller.display.show()
    sys.exit(app.exec_())
