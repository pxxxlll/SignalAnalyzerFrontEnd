# controller.py
from PyQt5.QtWidgets import QApplication, QMainWindow, QWidget, QVBoxLayout
from receiver import DataReceiver
from buffer import BlockBuffer
from processor import SignalProcessor
from display import SpectrumDisplay

class MainController(QMainWindow):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("频谱分析")
        self.resize(800, 600)

        # 模块初始化
        self.buffer = BlockBuffer(max_size=1024)
        self.receiver = DataReceiver(port=5000)
        self.processor = SignalProcessor(self.buffer)
        self.display = SpectrumDisplay()

        # 信号连接
        self.receiver.signal_data_received.connect(self.buffer.push)
        self.receiver.signal_client_connected.connect(self.display.try_enable_start)
        self.processor.signal_fft_ready.connect(self.display.update_spectrum)
        self.display.btn_start.clicked.connect(lambda _ : self.receiver.send_cmd("start"))

        # UI 布局
        central_widget = QWidget()
        layout = QVBoxLayout(central_widget)
        layout.addWidget(self.display)
        self.setCentralWidget(central_widget)

        # 启动线程
        self.receiver.start()
        self.processor.start()

    def closeEvent(self, event):
        # 程序退出时停止子线程
        self.receiver.stop()
        self.processor.stop()
        event.accept()


if __name__ == '__main__':
    import sys
    app = QApplication(sys.argv)
    window = MainController()
    window.show()
    sys.exit(app.exec_())
