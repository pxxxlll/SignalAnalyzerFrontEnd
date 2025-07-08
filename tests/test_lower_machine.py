import socket

HOST = '0.0.0.0'  
PORT = 5001

with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
    s.bind((HOST, PORT))
    s.listen()
    print(f"Listening on {HOST}:{PORT}")
    conn, addr = s.accept()
    print(f"Connected by {addr}")
    data = conn.recv(1024)
    print(f"Received: {data}")
