# iq_test_client.py
import socket
import struct
import numpy as np
import time
import logging

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

# ===== 信号参数 =====
FREQ_BIN = 64             # 目标频率 bin（产生一个频谱峰）
AMPLITUDE = 48            # 幅度 [-128, 127]，QAM16 一般为 ±48
NOISE_LEVEL = 3           # 加性噪声强度（0~±N）
VCLIENT_DEBUT = True     # 设置 True 以低速发送（调试用）

# ===== 构造 SINC-LIKE 包络 =====
window = np.hamming(PKG_IQ_POINTS)
n = np.arange(PKG_IQ_POINTS)
angle = 2 * np.pi * FREQ_BIN * n / PKG_IQ_POINTS
sinc_envelope = np.sinc((n - PKG_IQ_POINTS // 2) / 10)  # 控制主瓣宽度
envelope = (sinc_envelope * window)
envelope /= np.max(np.abs(envelope))  # 归一化

# ===== TCP连接 =====
sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
sock.connect((HOST, PORT))
logging.info(f"Connected to {HOST}:{PORT}")

frame_counter = 0

try:
    while True:
        for pkg_idx in range(FRAME_PKGS):
            # ---- 构造 IQ 信号 ----
            i_samples = AMPLITUDE * envelope * np.cos(angle)
            q_samples = AMPLITUDE * envelope * np.sin(angle)

            # ---- 加性噪声 ----
            i_noise = np.random.randint(-NOISE_LEVEL, NOISE_LEVEL + 1, size=PKG_IQ_POINTS)
            q_noise = np.random.randint(-NOISE_LEVEL, NOISE_LEVEL + 1, size=PKG_IQ_POINTS)
            i_samples = np.clip(i_samples + i_noise, -128, 127).astype(np.int8)
            q_samples = np.clip(q_samples + q_noise, -128, 127).astype(np.int8)

            # ---- 打包 IQ ----
            iq_interleaved = np.empty(PKG_IQ_POINTS * 2, dtype=np.int8)
            iq_interleaved[0::2] = i_samples
            iq_interleaved[1::2] = q_samples

            # ---- 扩展 payload ----
            payload = np.tile(iq_interleaved, BYTES_PER_POINT // 2)
            assert len(payload) == PKG_PAYLOAD_SIZE

            # ---- 帧头 + payload ----
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
                time.sleep(0.05)  # DEBUG: 慢速发送

        logging.info(f"Sent frame {frame_counter}")
        frame_counter = (frame_counter + 1) % 65536

except KeyboardInterrupt:
    logging.info("Interrupted by user")

finally:
    sock.close()
    logging.info("Socket closed")

