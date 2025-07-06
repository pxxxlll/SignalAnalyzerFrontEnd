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
BYTES_PER_POINT = 2 
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

CMD_START = b'\xAA\x55\xFF\xA0'
CMD_STOP  = b'\xAA\x55\xFF\xB1'

# ===== 信号参数 =====
FREQ_BIN = 64             # 目标频率 bin
AMPLITUDE = 48            # 幅度 [-128, 127]
NOISE_LEVEL = 3           # 噪声强度
VCLIENT_DEBUT = True      # 慢速发送调试

# ===== 预生成 IQ 波形（窗函数 + 包络）=====
window = np.hamming(PKG_IQ_POINTS)
n = np.arange(PKG_IQ_POINTS)
angle = 2 * np.pi * FREQ_BIN * n / PKG_IQ_POINTS
sinc_envelope = np.sinc((n - PKG_IQ_POINTS // 2) / 10)
envelope = sinc_envelope * window
envelope /= np.max(np.abs(envelope))

retry_cnt = 0
def connect_to_server():
    global retry_cnt
    while True:
        try:
            sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            sock.connect((HOST, PORT))
            logging.info(f"Connected to {HOST}:{PORT}")
            return sock
        except (ConnectionRefusedError, TimeoutError, OSError) as e:
            logging.warning(f"Connection failed: {e}. Retrying in 2 seconds ({retry_cnt})...")
            retry_cnt += 1
            time.sleep(2)


def send_frame(sock, frame_counter):
    for pkg_idx in range(FRAME_PKGS):
        i_samples = AMPLITUDE * envelope * np.cos(angle)
        q_samples = AMPLITUDE * envelope * np.sin(angle)

        i_noise = np.random.randint(-NOISE_LEVEL, NOISE_LEVEL + 1, size=PKG_IQ_POINTS)
        q_noise = np.random.randint(-NOISE_LEVEL, NOISE_LEVEL + 1, size=PKG_IQ_POINTS)
        i_samples = np.clip(i_samples + i_noise, -128, 127).astype(np.int8)
        q_samples = np.clip(q_samples + q_noise, -128, 127).astype(np.int8)

        iq_interleaved = np.empty(PKG_IQ_POINTS * 2, dtype=np.int8)
        iq_interleaved[0::2] = i_samples
        iq_interleaved[1::2] = q_samples

        payload = np.tile(iq_interleaved, BYTES_PER_POINT // 2)
        assert len(payload) == PKG_PAYLOAD_SIZE

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
            time.sleep(0.05)
    logging.info(f"Sent frame {frame_counter}")


def main_loop():
    frame_counter = 0
    sock = connect_to_server()
    sending = False

    while True:
        try:
            sock.settimeout(0.1)  # 设置短超时避免永久阻塞
            try:
                cmd = sock.recv(1024)
                if not cmd:
                    raise ConnectionResetError("Socket closed by server")

                if cmd.startswith(CMD_START):
                    sending = True
                    logging.info("Received START command")
                elif cmd.startswith(CMD_STOP):
                    sending = False
                    logging.info("Received STOP command")
            except socket.timeout:
                pass  # 正常，表示无新命令

            if sending:
                try:
                    send_frame(sock, frame_counter)
                    frame_counter = (frame_counter + 1) % 65536
                except (BrokenPipeError, ConnectionResetError, OSError) as e:
                    logging.warning(f"Disconnected while sending: {e}")
                    sock.close()
                    sock = connect_to_server()
                    sending = False  # 重新等待 START
        except (BrokenPipeError, ConnectionResetError, OSError) as e:
            logging.warning(f"Disconnected while listening: {e}")
            sock.close()
            sock = connect_to_server()
            sending = False


if __name__ == '__main__':
    try:
        main_loop()
    except KeyboardInterrupt:
        logging.info("Interrupted by user")
    finally:
        logging.info("Client exited")
