# receiver_mach.py
from PyQt5.QtCore import QObject, pyqtSignal, pyqtSlot, QTimer
from PyQt5.QtNetwork import QTcpServer, QTcpSocket, QHostAddress
import struct
import logging
from freq_utils import lo_index_to_freq  # 本振频率转换工具

logger = logging.getLogger("Receiver")
logging.basicConfig(level=logging.DEBUG)

class DataReceiver(QObject):
    signal_data_received = pyqtSignal(float, float, bytes)  # ksps, lo_freq_hz, payload
    signal_client_connected = pyqtSignal(bool)

    def __init__(self, ip='0.0.0.0', port=5001, emit_block_size=1024, parent=None):
        super().__init__(parent)

        self.port = port
        self.emit_block_size = emit_block_size
        self.byte_block_size = emit_block_size * 4  # 每个 IQ 点 4 字节

        # 协议定义
        self.HEADER_FMT = '<IIHHBHH'  # 对应 C 结构体
        self.HEADER_SIZE = struct.calcsize(self.HEADER_FMT)
        self._magic = struct.pack('<II', 0xAA55AA55, 0xAA55AA55)

        self.server = QTcpServer(self)
        self.server.newConnection.connect(self.on_new_connection)

        self.client = None
        self.buffer = b''
        self.aligned = False

        self.auto_mode = False            # 控制是否自动采集
        self.current_lo_index = 0         # 当前本振频率索引
        self.current_lo_freq = 0.0        # 当前本振频率（Hz）
        self.ksps_float = 10e6            # 采样率固定为 10MHz

    def start(self):
        if not self.server.listen(QHostAddress.Any, self.port):
            logger.error(f"Failed to start server: {self.server.errorString()}")
        else:
            logger.info(f"Listening on port {self.port}...")

    def stop(self):
        if self.client is not None:
            self.client.disconnectFromHost()

        if self.server.isListening():
            self.server.close()

        logger.info("Server stopped.")
        self.signal_client_connected.emit(False)

    @pyqtSlot()
    def on_new_connection(self):
        logger.debug("New connection attempt...")
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
        self.auto_mode = False  # 退出自动模式

    @pyqtSlot(str, int)
    def send_cmd(self, cmd: str, lo_index: int = 0):
        """
        发送控制命令：
        - "start": 携带本振频率索引
        - "stop": 固定复位指令
        """
        if not self.client or not self.client.isWritable():
            logger.warning("No active connection to send command.")
            return

        if cmd == "stop":
            packet = b'\xAA\x55\xFF\xFF'
            self.auto_mode = False
            logger.info("Sent STOP command.")
        elif cmd == "start":
            packet = struct.pack('<BBBB', 0xAA, 0x55, lo_index & 0xFF, (lo_index >> 8) & 0xFF)
            self.auto_mode = True
            self.current_lo_index = lo_index
            self.current_lo_freq = lo_index_to_freq(lo_index)
            logger.info(f"Sent START command (LO = {self.current_lo_freq/1e6:.2f} MHz)")
        else:
            logger.warning(f"Unknown command: {cmd}")
            return

        self.client.write(packet)

    @pyqtSlot()
    def on_ready_read(self):
        logger.debug("Data ready to read...") 
        self.buffer += self.client.readAll().data()
        logger.debug(f"Buffer size: {len(self.buffer)} bytes")

        # 首次对齐 header
        if not self.aligned:
            logger.debug("Aligning header...")
            idx = self.buffer.find(self._magic)
            if idx == -1:
                logger.debug("Waiting for header...")
                return

            if len(self.buffer) < idx + self.HEADER_SIZE:
                return  # 还没收到完整 header

            header_values = struct.unpack_from(self.HEADER_FMT, self.buffer, idx)
            # KSPS 字段被下位机用于传输本振频率索引，仅供参考，主逻辑由 start 指令设定

            self.aligned = True
            # hex_header = [f"{v:#010x}" if isinstance(v, int) else str(v) for v in header_values]
            # logger.debug(f"Header aligned: {hex_header}")

        # 接收并处理完整数据帧（固定长度）
        while len(self.buffer) >= self.byte_block_size:
            payload = self.buffer[:self.byte_block_size]
            self.buffer = self.buffer[self.byte_block_size:]

            # 发出数据帧：采样率、本振频率、数据
            self.signal_data_received.emit(self.ksps_float, self.current_lo_freq, payload)
            self.aligned = False # 重置对齐状态

            # 自动状态：收完后发 stop/start 实现轮询
            if self.auto_mode:
                self.send_cmd("stop")
                QTimer.singleShot(50, lambda: self.send_cmd("start", lo_index=self.current_lo_index))