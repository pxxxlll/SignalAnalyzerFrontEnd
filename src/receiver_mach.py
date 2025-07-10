from PyQt5.QtCore import QObject, pyqtSignal, pyqtSlot, QTimer
from PyQt5.QtNetwork import QTcpServer, QHostAddress
import struct
import logging
from functools import partial
from freq_utils import lo_index_to_freq, freq_to_lo_index, SweepConfig

logger = logging.getLogger("Receiver")
logging.basicConfig(level=logging.DEBUG)


class DataReceiver(QObject):
    signal_data_received = pyqtSignal(float, float, bytes, int)
    signal_client_connected = pyqtSignal(bool)

    def __init__(self, ip='0.0.0.0', port=5001, emit_block_size=1024,
                 sweep_config=SweepConfig(1e9, 2.7e9, 15), parent=None):
        super().__init__(parent)
        self.sweep_config = sweep_config
        self._sweep_config_version = sweep_config.version()

        self.port = port
        self.emit_block_size = emit_block_size
        self.byte_block_size = emit_block_size * 4

        self.HEADER_FMT = '<IIHBBHH'
        self.HEADER_SIZE = struct.calcsize(self.HEADER_FMT)
        self._magic = struct.pack('<II', 0xAA55AA55, 0xAA55AA55)

        self.server = QTcpServer(self)
        self.server.newConnection.connect(self.on_new_connection)
        self.client = None
        self.buffer = b''
        self.aligned = False

        self.auto_mode = False
        self.current_lo_index = 0
        self.current_lo_freq = 0.0
        self.ksps_float = 10e6

        self._sweep_step = 0
        self._last_sent_lo = None

        self.activated = False  # 是否已激活接收器

    def start(self):
        if not self.server.listen(QHostAddress.Any, self.port):
            logger.error(f"Failed to start server: {self.server.errorString()}")
        else:
            logger.info(f"Listening on port {self.port}...")

    def stop(self):
        if self.client:
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
        self._sweep_step = 0
        self._last_sent_lo = None
        logger.info(f"Client connected from {self.client.peerAddress().toString()}")
        self.signal_client_connected.emit(True)

    @pyqtSlot()
    def on_disconnected(self):
        logger.info("Client disconnected")
        self.signal_client_connected.emit(False)
        self.client.deleteLater()
        self.client = None
        self.auto_mode = False
        self._sweep_step = 0
        self._last_sent_lo = None

    @pyqtSlot(str, int)
    def send_cmd(self, cmd: str, lo_index: int = 0):
        if not self.client or not self.client.isWritable():
            logger.warning("No active connection to send command.")
            return

        if cmd == "stop":
            packet = bytes([0xAA,0x55,0xFF,0xFF])
            self.auto_mode = False
            logger.info("Sent STOP command.")
        elif cmd == "start":
            packet = bytes([0xAA, 0x55, (lo_index >> 8) & 0xFF, lo_index & 0xFF])
            # packet = bytes([0xAA, 0x55, lo_index & 0xFF, (lo_index >> 8) & 0xFF])
            # logger.debug(f"Sending bytes: {packet.hex()} (LO index = {lo_index})")
            
            self.auto_mode = True
            self.current_lo_index = lo_index
            self.current_lo_freq = lo_index_to_freq(lo_index)
            logger.info(f"Sent START command (LO = {self.current_lo_freq/1e6:.2f} MHz)")
            self.activated = True
        else:
            logger.warning(f"Unknown command: {cmd}")

            return

        self.client.write(packet)

    # def _next_sweep_lo_index(self):
    #     points = max(1, self.sweep_config.points)
    #     # if self._sweep_step >= points:
    #         # logger.info("Sweep completed. Wrapping to beginning.")
    #         # self._sweep_step = 0

    #     freq_step = self.sweep_config.start + self._sweep_step * (
    #         (self.sweep_config.stop - self.sweep_config.start) / max(1, points - 1))
    #     lo_index = freq_to_lo_index(freq_step)

    #     self._sweep_step += 1
    #     self._sweep_step %= points  # 确保步数循环

    #     return lo_index, freq_step

    @pyqtSlot()
    def on_ready_read(self):
        if not self.activated:
            logger.warning("Receiver not activated, ignoring data.")
            return  
        self.buffer += self.client.readAll().data()

        # 检查 sweep 配置版本
        latest_version = self.sweep_config.version()
        if latest_version != self._sweep_config_version:
            logger.debug("Sweep config changed externally, resetting sweep.")
            self._sweep_step = 0
            self._sweep_config_version = latest_version
            self._last_sent_lo = None

        while True:
            if not self.aligned:
                idx = self.buffer.find(self._magic)
                if idx == -1:
                    return  # 没找到帧头
                if len(self.buffer) < idx + self.byte_block_size:
                    return  # 帧头之后的数据还不够一帧

                _header = self.buffer[idx:idx + self.HEADER_SIZE] if idx != -1 else b''
                # save_payload(self.buffer[idx : idx + self.HEADER_SIZE + self.byte_block_size], prefix=f"raw{self._sweep_step:02d}_lo_idx{struct.unpack(self.HEADER_FMT, _header)[2]}")
                
                self.current_lo_freq = lo_index_to_freq(struct.unpack(self.HEADER_FMT, _header)[2])
                logger.debug(f"lo_index_Dec: {struct.unpack(self.HEADER_FMT, _header)[2]}")
                logger.debug(f"Found frame header at index {idx}, LO = {self.current_lo_freq/1e6:.2f} MHz")

                self.buffer = self.buffer[idx + self.HEADER_SIZE:]  # 丢弃帧头前杂数据

                # save_payload(self.buffer, prefix=f"payload_received{self._sweep_step:02d}_lo_idx{struct.unpack(self.HEADER_FMT, _header)[2]}")

                self.aligned = True

            # 此时 self.buffer 已对齐
            if len(self.buffer) < self.byte_block_size:
                return  # 数据不够，继续等

            payload = self.buffer[:self.byte_block_size]

            # save_payload(payload, prefix=f"payload_to_emit{self._sweep_step:02d}_lo_idx{struct.unpack(self.HEADER_FMT, _header)[2]}")


            self.buffer = self.buffer[self.byte_block_size:]

            logger.debug(f"Receiver emitting frame: LO = {self.current_lo_freq/1e6:.2f} MHz, payload = {len(payload)} bytes")
            self.signal_data_received.emit(self.ksps_float, self.current_lo_freq, payload, self._sweep_step) # TODO
            # self._sweep_step += 1
            # self._sweep_step %= self.sweep_config.points  # 确保步数循环

            # 可选：保存 payload

            self.aligned = False  # 每帧都重新找帧头（如果能确保连续对齐，也可不重置）
    
    @pyqtSlot()
    def next_sweep(self):
        self._sweep_step += 1
        self._sweep_step %= self.sweep_config.points  # 确保步数循环
        self.send_cmd("stop")
        next_lo = freq_to_lo_index(self.sweep_config.start + self._sweep_step * (self.sweep_config.stop - self.sweep_config.start) / max(1, self.sweep_config.points - 1))
        print(f"Next LO Index (Dec): {next_lo}")
        QTimer.singleShot(100, partial(self.send_cmd, "start", lo_index=int(next_lo)))




