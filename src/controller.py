# controller.py
from PyQt5.QtWidgets import QApplication, QMainWindow, QWidget, QVBoxLayout
from PyQt5.QtCore import QThread
from receiver import DataReceiver
# from buffer import BlockBuffer
from processor import SignalProcessor
from display import SpectrumDisplay

class MainController(QMainWindow):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("频谱分析")
        self.resize(800, 600)
        self.thread_processor = QThread()

        # 模块初始化
        self.receiver = DataReceiver(port=5000)

        self.processor = SignalProcessor()
        self.processor.moveToThread(self.thread_processor)

        self.display = SpectrumDisplay()

        # 信号连接
        self.receiver.signal_data_received.connect(self.processor.process_frame) # 信号处理器在 thread 中
        self.receiver.signal_client_connected.connect(self.display.try_enable_start)
        self.processor.signal_fft_ready.connect(self.display.update_spectrum)
        self.display.btn_start.clicked.connect(lambda: self.receiver.send_cmd("start"))

        # UI 布局
        central_widget = QWidget()
        layout = QVBoxLayout(central_widget)
        layout.addWidget(self.display)
        self.setCentralWidget(central_widget)

        # 激活模块
        self.receiver.start() # start 也可以写在 init 里，这里主要是实现上位机开启和关断连接的需求
        self.thread_processor.start()
        
    def closeEvent(self, event):
        # 程序退出时停止子线程
        self.receiver.stop()
        event.accept()


if __name__ == '__main__':
    import sys
    app = QApplication(sys.argv)
    window = MainController()
    window.show()
    sys.exit(app.exec_())
