from PyQt5.QtWidgets import QApplication
from PyQt5.QtCore import QThread

from receiver_mach import DataReceiver
from main_window import MainWindow
from processor_mach import SignalProcessor

import logging
logging.basicConfig(level=logging.DEBUG)


class MainController:
    def __init__(self):
        super().__init__()

        # === 初始化模块 ===
        self.receiver = DataReceiver(port=5001)
        self.display = MainWindow()
        self.display.setWindowTitle("Signal Analyzer")

        self.processor = SignalProcessor()
        self.processor_thread = QThread()
        self.processor.moveToThread(self.processor_thread)
        self.processor_thread.setObjectName("ProcessorThread")
        self.processor_thread.start()

        # === 信号连接 ===
        self.receiver.signal_data_received.connect(self.processor.process_frame)

        self.receiver.signal_client_connected.connect(
            lambda flag: self.display.conn_state_set('connected') if flag
            else self.display.conn_state_set("normal"))

        # 各图形更新信号
        self.processor.signal_fft_ready.connect(self.display.update_spectrum)
        self.processor.signal_sweep_ready.connect(self.display.figures.update_sweep_spectrum)
        self.processor.signal_constellation_ready.connect(self.display.update_constellation)
        self.processor.signal_iq_ready.connect(self.display.update_iq)

        # UI → 接收控制
        self.display.signal_try_conn.connect(self.receiver.start)
        self.display.signal_try_off.connect(self.receiver.stop)

        # 控制按钮操作（默认固定 LO 点，3 GHz）
        self.display.btn_start.clicked.connect(lambda: self.receiver.send_cmd("start", lo_index=32767))
        self.display.btn_stop.clicked.connect(lambda: self.receiver.send_cmd("stop"))

        # === 预留：UI 扫频参数更改接口 ===
        # self.display.signal_sweep_config_changed.connect(self.processor.update_sweep_range)

    def closeEvent(self, event):
        self.receiver.stop()
        event.accept()


# === 主程序入口 ===
if __name__ == '__main__':
    import sys
    app = QApplication(sys.argv)
    controller = MainController()
    controller.display.show()
    sys.exit(app.exec_())
