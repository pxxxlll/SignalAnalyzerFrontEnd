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

# 指定频谱峰值出现在第 N_bin 点（范围 0~1023）
FREQ_BIN = 64  # 改成你希望的频点（可调）
PHASE = 0
AMPLITUDE = 48  # 满量程 ±128，48是QAM16中的最大幅度之一

# 生成 1024 点复正弦波
n = np.arange(PKG_IQ_POINTS)
angle = 2 * np.pi * FREQ_BIN * n / PKG_IQ_POINTS + PHASE
i_samples = (AMPLITUDE * np.cos(angle)).astype(np.int8)
q_samples = (AMPLITUDE * np.sin(angle)).astype(np.int8)

# ===== 连接服务器 =====
sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
sock.connect((HOST, PORT))
logging.info(f"Connected to {HOST}:{PORT}")

frame_counter = 0

try:
    while True:
        # for pkg_idx in range(FRAME_PKGS):
        for pkg_idx in range(FRAME_PKGS):
            # ---- 构造 IQ 信号 ----
            n = np.arange(PKG_IQ_POINTS)
            angle = 2 * np.pi * FREQ_BIN * n / PKG_IQ_POINTS
            i_samples = (AMPLITUDE * np.cos(angle)).astype(np.int8)
            q_samples = (AMPLITUDE * np.sin(angle)).astype(np.int8)

            iq_interleaved = np.empty(PKG_IQ_POINTS * 2, dtype=np.int8)
            iq_interleaved[0::2] = i_samples
            iq_interleaved[1::2] = q_samples

            # ---- 扩展为 payload ----
            payload = np.tile(iq_interleaved, BYTES_PER_POINT // 2)
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

            sock.sendall(packet)
            if VCLIENT_DEBUT:
                time.sleep(0.05)  # 可选：让可视化效果更稳定

except KeyboardInterrupt:
    logging.info("Interrupted by user")

finally:
    sock.close()
    logging.info("Socket closed")
