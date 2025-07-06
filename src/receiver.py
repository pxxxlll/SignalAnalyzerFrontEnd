from PyQt5.QtCore import QObject, pyqtSignal, QTimer, pyqtSlot
from PyQt5.QtNetwork import QTcpServer, QTcpSocket, QHostAddress
import struct
import logging

logger = logging.getLogger("Receiver")
logging.basicConfig(level=logging.DEBUG)

class DataReceiver(QObject):
    signal_data_received = pyqtSignal(float, bytes)
    signal_client_connected = pyqtSignal(bool)

    def __init__(self, ip='0.0.0.0', port=5000, emit_block_size=1024, parent=None):
        super().__init__(parent)
        self.port = port
        self.emit_block_size = emit_block_size
        self.byte_block_size = emit_block_size * 2
        self._header_len = 16
        self._magic = struct.pack('<II', 0xAA55AA55, 0xAA55AA55)
        self.HEADER_FMT = '<IIHHBHH'  

        self.server = QTcpServer(self)
        self.server.newConnection.connect(self.on_new_connection)

        self.client = None
        self.buffer = b''
        self.aligned = False

    def start(self):
        if not self.server.listen(QHostAddress.Any, self.port):
            logger.error(f"Failed to start server: {self.server.errorString()}")
        else:
            logger.info(f"Listening on port {self.port}...")

    def stop(self):
        if self.client is not None:
            self.client.disconnectFromHost()
            # self.client will be closed and set to None in on_disconnected
            
        if self.server.isListening():
            self.server.close()
        logger.info("Server stopped.")
        self.signal_client_connected.emit(False)

    @pyqtSlot()
    def on_new_connection(self):
        if self.client:
            self.client.close()

        self.client = self.server.nextPendingConnection()
        self.client.readyRead.connect(self.on_ready_read)
        self.client.disconnected.connect(self.on_disconnected)

        self.buffer = b''
        self.aligned = False

        logger.info(f"Client connected from {self.client.peerAddress().toString()}")
        self.signal_client_connected.emit(True)

    @pyqtSlot()
    def on_disconnected(self):
        logger.info("Client disconnected")
        self.signal_client_connected.emit(False)
        self.client.deleteLater()
        self.client = None

    @pyqtSlot()
    def send_cmd(self, cmd: str):
        cmd_map = {
            "start": b'\xAA\x55\xFF\xA0',
           "stop": b'\xAA\x55\xFF\xB1'
        }

        if not self.client or not self.client.isWritable():
            logger.warning("No active connection to send command.")
            return

        if cmd not in cmd_map:
            logger.warning(f"Unknown command: {cmd}")
            return

        self.client.write(cmd_map[cmd])
        logger.info(f"Sent command: {cmd.upper()}")


    @pyqtSlot()
    def on_ready_read(self):
        self.buffer += self.client.readAll().data()
        HEADER_SIZE = struct.calcsize(self.HEADER_FMT)

        # 只对齐一次
        if not self.aligned:
            idx = self.buffer.find(self._magic)
            if idx == -1:
                logger.debug("Waiting for header...")
                return

            if len(self.buffer) < idx + HEADER_SIZE:
                return  # 还没收到完整 header

            header_values = struct.unpack_from(self.HEADER_FMT, self.buffer, idx)
            self.ksps_float = float(header_values[2]) * 1000
            logger.debug(f"Aligned at {idx}, KSPS = {self.ksps_float}")

            self.buffer = self.buffer[idx + HEADER_SIZE:]
            self.aligned = True

        # 一次性尽可能多处理完整数据块
        while len(self.buffer) >= self.byte_block_size:
            block = self.buffer[:self.byte_block_size]
            self.buffer = self.buffer[self.byte_block_size:]
            self.signal_data_received.emit(self.ksps_float, block)