# freq_utils.py
"""
本振频率转换工具：提供索引与 Hz 之间的双向映射。
用于 start 指令中频点控制与 UI 显示。
"""

# 频率上下限
LO_FREQ_MIN_HZ = 1_000_000_000  # 1 GHz
LO_FREQ_MAX_HZ = 5_000_000_000  # 5 GHz
LO_INDEX_MAX = 0xFFFF           # 有效索引范围：0 ~ 65534

def lo_index_to_freq(index: int) -> float:
    """
    将频率索引转换为实际频率（Hz）。
    """
    if not (0 <= index <= LO_INDEX_MAX):
        raise ValueError(f"Invalid LO index: {index}")
    scale = (index / LO_INDEX_MAX)
    return LO_FREQ_MIN_HZ + scale * (LO_FREQ_MAX_HZ - LO_FREQ_MIN_HZ)

def freq_to_lo_index(freq_hz: float) -> int:
    """
    将实际频率（Hz）转换为频率索引。
    """
    if not (LO_FREQ_MIN_HZ <= freq_hz <= LO_FREQ_MAX_HZ):
        raise ValueError(f"Frequency {freq_hz} out of range")
    scale = (freq_hz - LO_FREQ_MIN_HZ) / (LO_FREQ_MAX_HZ - LO_FREQ_MIN_HZ)
    return int(scale * LO_INDEX_MAX)


# freq_utils.py
class SweepConfig:
    """
    扫频配置类：用于存储扫频参数并提供修改感知能力。
    """
    def __init__(self, start: float, stop: float, points: int):
        self.start = start
        self.stop = stop
        self.points = points
        self._version = 0

    def __repr__(self):
        return f"sweep_config(start={self.start}, stop={self.stop}, points={self.points})"

    def reset_runtime_state(self):
        self._version += 1

    def version(self):
        return self._version
 