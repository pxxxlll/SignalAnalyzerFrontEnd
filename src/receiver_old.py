import socket
import threading
import logging
import sys
from PyQt5.QtCore import QObject, pyqtSignal
from PyQt5.QtWidgets import QApplication
import struct

logger = logging.getLogger("Receiver")
logger.setLevel(logging.DEBUG)
ch = logging.StreamHandler()
ch.setFormatter(logging.Formatter("[%(name)s] %(message)s"))
logger.addHandler(ch)


class DataReceiver(QObject):
    signal_data_received = pyqtSignal(bytes)  # 发出每段 payload（不含帧头）
    signal_client_connected = pyqtSignal(bool)

    def __init__(self, ip='0.0.0.0', port=5000, emit_block_size=1024):
        """
        emit_block_size: 每次发射多少个 IQ 点（1 IQ 点 = 2 字节）
        """
        super().__init__()
        self.ip = ip
        self.port = port
        self.emit_block_size = emit_block_size
        self.byte_block_size = emit_block_size * 2
        self.running = False
        self.sock = None
        self.thread = None
        self.conn = None  # TCP连接对象

        self._magic = struct.pack('<II', 0xAA55AA55, 0xAA55AA55)
        self._header_len = 16

        self._command_map = {
            "start" : b'\xAA\x55\xFF\xA0',
            "end" : b'\xAA\x55\xFF\xB1'
        }
        self._event_map = { # 字典结构, 命令可扩展
            "start" : threading.Event(), # 用来做 start 和 stop 的同步, wait start 可以防阻塞 cpu 占用
            "end" : threading.Event()
        }

    def start(self):
        if self.running:
            return
        self.running = True
        self.thread = threading.Thread(target=self._recv_loop, daemon=True)
        self.thread.start()

    def stop(self):
        self.running = False
        if self.conn:
            try:
                self.conn.shutdown(socket.SHUT_RDWR)
                self.conn.close()
            except:
                pass
        if self.sock:
            try:
                self.sock.close()
            except:
                pass
        self.sock = None
        self.conn = None

    def send_cmd(self, cmd: str):

        if self.conn is None:
            logger.warning(f"Cannot send command '{cmd.upper()}': no active connection.")
            return

        if not cmd in self._command_map:
            logger.warning(f'"{cmd}" is not a valid command, please send one in {list(self._command_map.keys())}.')
            return # do nothing

        try:
            self.conn.sendall(self._command_map[cmd])
            logger.info(f"Sent {cmd.upper()} command to lower machine.")
            self._event_map[cmd].set()

        except Exception as e:
            logger.warning(f"Failed to send {cmd.upper()} command: {e}")


    def _align_to_header(self, buffer: bytes) -> bytes:
        """搜索合法帧头，并返回从帧头开始的 buffer"""
        idx = buffer.find(self._magic)
        logger.debug("Header found." if idx != -1 else "Header not found.")
        return buffer[idx:] if idx != -1 else b''


    def _recv_loop(self):
        try:
            self.sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            self.sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
            self.sock.bind((self.ip, self.port))
            self.sock.listen(1)
            logger.info(f"Waiting for connection on {self.ip}:{self.port}...")
            self.conn, addr = self.sock.accept()

            self.signal_client_connected.emit(True if self.conn is not None else False)                

            self.conn.settimeout(1)
            logger.info(f"Connected from {addr}")

            buffer = b''
            aligned = False

            self._event_map["start"].wait() # 挂起等待 start 事件
            logger.debug("Starting data recv...")

            while self.running:
                try:
                    data = self.conn.recv(4096)
                    # logger.debug(f"Received data len: {len(data)}")
                    if not data:
                        break
                except socket.timeout:
                    logger.warning(f"Receive time out ({self.conn.gettimeout()} s).")
                    continue

                except Exception as e:
                    logger.error(f"Receiver error: {e}")
                    break # 避免死循环

                buffer += data
                if not aligned:
                    logger.debug("Aligning header...")
                    buffer = self._align_to_header(buffer) # 找到 hearder 则返回从 header 开始的数据
                    if len(buffer) >= self._header_len:
                        buffer = buffer[self._header_len:]  # skip header
                        aligned = True
                    else:
                        continue

                while len(buffer) >= self.byte_block_size:
                    logger.debug(f"Now buffer has {len(buffer) / self.byte_block_size} blocks.")
                    block = buffer[:self.byte_block_size]
                    buffer = buffer[self.byte_block_size:]
                    logger.debug(f"Emitting block of len {len(block)}...")
                    self.signal_data_received.emit(block)

        except Exception as e:
            logger.error(f"Error: {e}")
        finally:
            self.stop()
            logger.info("Stopped.")


if __name__ == "__main__":
    from PyQt5.QtWidgets import QApplication, QLabel, QPushButton, QVBoxLayout, QWidget

    # 1.对象实例化, 模块搭建
    app = QApplication(sys.argv)

    # 小窗口 UI
    win = QWidget()
    win.setWindowTitle("Receiver Test")
    layout = QVBoxLayout(win)

    label_status = QLabel("未连接")
    btn_start = QPushButton("Start")
    btn_start.setEnabled(False)

    layout.addWidget(label_status)
    layout.addWidget(btn_start)
    win.setLayout(layout)

    # 实例化接收器
    receiver = DataReceiver(port=5000, emit_block_size=1024)

    def on_data_received(data: bytes):
        iq_points = len(data) // 2
        label_status.setText(f"接收 {iq_points} 点")

    def try_enable_start():
        logger.debug("Enabling start...")
        if receiver.conn is not None:
            label_status.setText("已连接")
            btn_start.setEnabled(True)

    def handle_start_clicked():
        receiver.send_cmd("start")
        btn_start.setEnabled(False)

    # 2. 连线
    receiver.signal_data_received.connect(on_data_received)
    btn_start.clicked.connect(handle_start_clicked)

    # 3. 启动
    receiver.start()

    # 后台线程轮询连接状态
    from PyQt5.QtCore import QThread, QEvent
    from PyQt5.QtCore import Qt
    def poll_conn():
        while receiver.conn is None and receiver.running:
            logger.debug("Checking connection...")
            QThread.msleep(200)
        app.postEvent(win, QEvent(QEvent.User))  # 触发自定义事件
        logger.debug("QEvent posted!")

    class EventReceiver(QObject):
        def eventFilter(self, watched, event): # 注意函数的签名
            if event.type() == QEvent.User:
                logger.debug("QEvent captured!")
                try_enable_start()
                return True
            return super().eventFilter(watched, event)

    event_receiver = EventReceiver()
    win.installEventFilter(event_receiver) # 如果没有对 EventReciever 对象的引用, 它就会被回收, 引用计数机制

    # 启动轮询线程（检测连接）
    win.show()
    threading.Thread(target=poll_conn, daemon=True).start()
    
    sys.exit(app.exec_())

