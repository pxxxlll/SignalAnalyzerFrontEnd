# buffer.py
from queue import Queue, Empty

class BlockBuffer:
    def __init__(self, max_size=100):
        self.queue = Queue(maxsize=max_size)

    def push(self, frame_bytes: bytes):
        """将接收到的完整帧放入缓冲队列"""
        try:
            self.queue.put_nowait(frame_bytes) # 内部带锁
        except:
            print("[Buffer] Warning: Queue is full, frame dropped")

    def pop(self, timeout=0.01) -> bytes:
        """尝试从缓冲队列中取出一帧，若无数据则抛出 Empty"""
        try:
            return self.queue.get(timeout=timeout)
        except Empty:
            return None

    def size(self):
        return self.queue.qsize()

    def clear(self):
        """清空所有缓存帧"""
        while not self.queue.empty():
            try:
                self.queue.get_nowait()
            except:
                break
