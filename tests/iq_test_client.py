# iq_test_client.py
import socket
import struct
import numpy as np
import time
import logging

VCLIENT_DEBUT = True

logging.basicConfig(level=logging.INFO, format='[SimClient] %(message)s')

# ===== 协议参数 =====
HOST = '127.0.0.1'
PORT = 5000

PKG_IQ_POINTS = 1024
BYTES_PER_POINT = 16
PKG_PAYLOAD_SIZE = PKG_IQ_POINTS * BYTES_PER_POINT
HEADER_SIZE = 16
FRAME_PKGS = 64 

# ===== 帧头常量 =====
HEADER_ID0 = 0xAA55AA55
HEADER_ID1 = 0xAA55AA55
HEADER_KSPS = 40000
HEADER_RES = 16
HEADER_SIGNBIT = 0x21
HEADER_LENGTH = PKG_IQ_POINTS

# FPS = 1
# SEND_INTERVAL = 1.0 / FPS

# ===== QAM16 星座点（缩放后） =====
QAM16_LEVELS = np.array([-3, -1, +1, +3], dtype=np.int8) * 16  # [-48, -16, 16, 48]

# ===== 连接服务器 =====
sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
sock.connect((HOST, PORT))
logging.info(f"Connected to {HOST}:{PORT}")

frame_counter = 0

try:
    while True:
        # for pkg_idx in range(FRAME_PKGS):
        for pkg_idx in range(FRAME_PKGS) or VCLIENT_DEBUT: # DEBUG
            # ---- 构造 payload ----
            i_samples = np.random.choice(QAM16_LEVELS, PKG_IQ_POINTS)
            q_samples = np.random.choice(QAM16_LEVELS, PKG_IQ_POINTS)

            iq_interleaved = np.empty(PKG_IQ_POINTS * 2, dtype=np.int8)
            iq_interleaved[0::2] = i_samples
            iq_interleaved[1::2] = q_samples

            # ---- 加噪声（±1 ~ ±2）----
            noise = 0 * np.random.randint(-2, 3, size=iq_interleaved.shape, dtype=np.int8)
            iq_noisy = (iq_interleaved + noise).astype(np.int8)

            # ---- 扩展到 BYTES_PER_POINT ----
            payload = np.tile(iq_noisy, BYTES_PER_POINT // 2)
            assert len(payload) == PKG_PAYLOAD_SIZE

            # ---- 构造 packet ----
            if pkg_idx == 0:
                header = struct.pack(
                    '<IIHHBHH',
                    HEADER_ID0,
                    HEADER_ID1,
                    HEADER_KSPS,
                    HEADER_RES,
                    HEADER_SIGNBIT,
                    HEADER_LENGTH,
                    frame_counter
                )
                packet = header + payload.tobytes()
            else:
                packet = payload.tobytes()

            logging.debug(f"Sending packet len: {len(packet)}")
            sock.sendall(packet)
            if VCLIENT_DEBUT:
                time.sleep(.1)

        logging.info(f"Sent frame {frame_counter}")
        frame_counter = (frame_counter + 1) % 65536
        # time.sleep(SEND_INTERVAL)

except KeyboardInterrupt:
    logging.info("Interrupted by user")

finally:
    sock.close()
    logging.info("Socket closed")
