# iq_test_client.py
import socket
import numpy as np
import time
import logging

logging.basicConfig(level=logging.INFO, format='[Client] %(message)s')

HOST = '127.0.0.1'  # 改为目标服务器地址（接收方）
PORT = 5000
FRAME_SIZE = 2048  # 每帧 2048 字节（1024 IQ 点）
FPS = 50  # 每秒发送 50 帧

sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
sock.connect((HOST, PORT))
logging.info(f"Connected to {HOST}:{PORT}")

try:
    while True:
        # 生成 1024 个 IQ 点（每个 8bit），交错排列
        i = np.random.randint(-128, 127, 1024, dtype=np.int8)
        q = np.random.randint(-128, 127, 1024, dtype=np.int8)
        frame = np.empty(2048, dtype=np.int8)
        frame[0::2] = i
        frame[1::2] = q

        sock.sendall(frame.tobytes())
        logging.debug("Sent 1 frame")

        time.sleep(1 / FPS)

except KeyboardInterrupt:
    logging.info("Interrupted by user")
finally:
    sock.close()
    logging.info("Socket closed")
