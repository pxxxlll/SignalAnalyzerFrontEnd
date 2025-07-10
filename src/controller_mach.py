from PyQt5.QtWidgets import QApplication
from PyQt5.QtCore import QThread, QTimer, pyqtSlot, QObject

from functools import partial

from receiver_mach import DataReceiver
from main_window import MainWindow
from processor_mach import SignalProcessor
from freq_utils import *

import logging
logging.basicConfig(level=logging.DEBUG)


class MainController(QObject):
    def __init__(self):
        super().__init__()

        # === 初始化模块 ===
        self.sweep_config = SweepConfig(start=1e9, stop=2.7090104524299994e9, points=15)

        self.receiver = DataReceiver(port=5001, sweep_config=self.sweep_config)
        self.display = MainWindow()
        self.display.setWindowTitle("Signal Analyzer")

        self.processor = SignalProcessor(sweep_config=self.sweep_config)
        # self.processor_thread = QThread()
        # self.processor.moveToThread(self.processor_thread)
        # self.processor_thread.setObjectName("ProcessorThread")
        # self.processor_thread.start()

        # === 信号连接 ===
        self.receiver.signal_data_received.connect(self.processor.process_frame)

        self.receiver.signal_client_connected.connect(
            lambda flag: self.display.conn_state_set('connected') if flag
            else self.display.conn_state_set("normal"))

        # 各图形更新信号
        self.processor.signal_fft_ready.connect(self.display.update_spectrum)
        self.processor.signal_sweep_ready.connect(self.display.update_sweep_spectrum)
        self.processor.signal_constellation_ready.connect(self.display.update_constellation)
        self.processor.signal_iq_ready.connect(self.display.update_iq)
        self.processor.signal_s21_ready.connect(self.display.update_s21)

        # self.processor.signal_frame_end.connect(self.receiver.next_sweep) # 
        self.processor.signal_frame_end.connect(self.on_frame_processed) # 申请信号量
        self.display.signal_ui_all_updated.connect(self.receiver.next_sweep)


        # UI → 接收控制
        self.display.signal_try_conn.connect(self.receiver.start)
        self.display.signal_try_off.connect(self.receiver.stop)

        # 控制按钮操作
        def send_restart():
            self.receiver.send_cmd("stop")
            QTimer.singleShot(50, partial(self.receiver.send_cmd, "start", freq_to_lo_index(self.sweep_config.start)))

        self.display.btn_start.clicked.connect(send_restart)
        self.display.btn_stop.clicked.connect(lambda: self.receiver.send_cmd("stop"))

        # === 预留：UI 扫频参数更改接口 ===
        # self.display.signal_sweep_config_changed.connect(self.processor.update_sweep_range)u'p

    def set_sweep_config(self, config: SweepConfig):
        # 不替换 sweep_config 对象，而是更新其字段
        self.sweep_config.start = config.start
        self.sweep_config.stop = config.stop
        self.sweep_config.points = config.points
        self.sweep_config.reset_runtime_state()
        logging.info(f"Sweep config updated: {self.sweep_config}")
    
    @pyqtSlot()
    def on_frame_processed(self):
        """
        当 Processor 处理完后，通过信号激活此槽
        """
        logging.debug("Frame processed, requesting UI update...")
        QTimer.singleShot(0, self.display.wait_for_ui_update)


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
