from PyQt5.QtCore import QObject, pyqtSignal, QTimer
from PyQt5.QtNetwork import QTcpServer, QTcpSocket, QHostAddress
import struct
import logging

logger = logging.getLogger("Receiver")

class DataReceiver(QObject):
    signal_data_received = pyqtSignal(bytes)
    signal_client_connected = pyqtSignal(bool)

    def __init__(self, ip='0.0.0.0', port=5000, emit_block_size=1024, parent=None):
        super().__init__(parent)
        self.port = port
        self.emit_block_size = emit_block_size
        self.byte_block_size = emit_block_size * 2
        self._header_len = 16
        self._magic = struct.pack('<II', 0xAA55AA55, 0xAA55AA55)

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
        if self.client:
            self.client.disconnectFromHost()
            self.client.close()
            self.client = None
        self.server.close()
        logger.info("Server stopped.")

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

    def on_disconnected(self):
        logger.info("Client disconnected")
        self.signal_client_connected.emit(False)
        self.client.deleteLater()
        self.client = None

    def send_cmd(self, cmd: str):
        cmd_map = {
            "start": b'\xAA\x55\xFF\xA0',
            "end": b'\xAA\x55\xFF\xB1'
        }

        if not self.client or not self.client.isWritable():
            logger.warning("No active connection to send command.")
            return

        if cmd not in cmd_map:
            logger.warning(f"Unknown command: {cmd}")
            return

        self.client.write(cmd_map[cmd])
        logger.info(f"Sent command: {cmd.upper()}")

    def on_ready_read(self):
        self.buffer += self.client.readAll().data()

        if not self.aligned:
            idx = self.buffer.find(self._magic)
            if idx != -1:
                logger.debug("Header aligned")
                self.buffer = self.buffer[idx + self._header_len:]
                self.aligned = True
            else:
                logger.debug("Waiting for header...")
                return

        while len(self.buffer) >= self.byte_block_size:
            block = self.buffer[:self.byte_block_size]
            self.buffer = self.buffer[self.byte_block_size:]
            self.signal_data_received.emit(block)
