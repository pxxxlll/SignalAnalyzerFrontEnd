# receiver.py
import socket
import threading
import logging
from PyQt5.QtCore import QObject, pyqtSignal

logger = logging.getLogger("Receiver")
logger.setLevel(logging.DEBUG)
ch = logging.StreamHandler()
formatter = logging.Formatter("[%(name)s] %(message)s")
ch.setFormatter(formatter)
logger.addHandler(ch)

class DataReceiver(QObject):
    signal_data_received = pyqtSignal(bytes)  # 发出原始数据帧（bytes）

    def __init__(self, ip='0.0.0.0', port=5000, frame_size=2048):
        super().__init__()
        self.ip = ip
        self.port = port
        self.frame_size = frame_size  # 每帧 2048 字节（1024 IQ 点）
        self.running = False
        self.sock = None
        self.thread = None

    def start(self):
        if self.running:
            return
        self.running = True
        self.thread = threading.Thread(target=self._recv_loop, daemon=True)
        self.thread.start()

    def stop(self):
        self.running = False
        if self.sock:
            try:
                self.sock.shutdown(socket.SHUT_RDWR)
                self.sock.close()
            except:
                pass
        self.sock = None

    def _recv_loop(self):
        try:
            self.sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            self.sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
            self.sock.bind((self.ip, self.port))
            self.sock.listen(1)
            logger.info(f"Waiting for connection on {self.ip}:{self.port}...")
            conn, addr = self.sock.accept()
            logger.info(f"Connected from {addr}")

            buffer = b''
            while self.running:
                # TODO: 帧头对齐
                data = conn.recv(4096) # 收到最多 4096 字节
                if not data:
                    break
                logger.debug(f"Received {len(data)} bytes")
                buffer += data
                while len(buffer) >= self.frame_size: # 如果buffer里面有超过一帧长度的数据
                    frame = buffer[:self.frame_size]
                    buffer = buffer[self.frame_size:]
                    logger.debug(f"Emitting frame of size {len(frame)}")
                    self.signal_data_received.emit(frame)

        except Exception as e:
            logger.error(f"Error: {e}")
        finally:
            self.stop()
            logger.info("Stopped")
