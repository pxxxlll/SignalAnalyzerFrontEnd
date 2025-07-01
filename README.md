# QAM 频谱接收与可视化

本项目基于 PyQt5 + PyQtGraph 实现实时频谱接收、处理与可视化，适用于 IQ 数据流的快速开发与调试。

---

## 功能概览

- ✅ 支持通过 TCP 接收 IQ 数据（1024 点/帧，交错 I/Q）
- ✅ 实时 FFT 运算，展示频谱图
- ✅ 可扩展的数据处理与可视化结构
- ✅ 兼容 PyQt5 线程模型，不卡 GUI

---

## 启动方式

开发者直接执行：

```bash
python ./src/controller.py
````

---

## 文件结构概览

```
src/
├── controller.py         # 主控制器，连接 UI 与模块
├── receiver.py           # 数据接收模块（TCP server）
├── processor.py          # FFT 处理逻辑
├── display.py            # 频谱绘图封装（QWidget）
├── buffer.py             # 简单线程安全队列
├── ui/
│   ├── main_window.ui    # Qt Designer 文件（可选）
│   └── main_window_ui.py # 由 pyuic5 生成
```

---

## TODO

* [ ] 明确下位机是 TCP server 还是 client（目前为 TCP client）
* [ ] 明确下位机发送的 8bit IQ 数据是 **有符号** 还是无符号
* [ ] 添加帧头识别与校验
* [ ] 增加频谱平滑或平均功能

---

## 开发流程建议

### 1. 克隆仓库

```bash
git clone <此处填写项目 git 地址>
cd 项目目录
```

建议使用虚拟环境安装依赖：

```bash
conda create -n qam_vis python=3.8
conda activate qam_vis
pip install -r requirements.txt
```

---

## 🧩 使用 Qt Designer 设计 UI 的接入方式

如果你使用 Qt Designer 修改或新增界面：

### 1. 保存 `.ui` 文件至：

```
src/ui/main_window.ui
```

### 2. 使用 pyuic5 转换为 Python 文件

```bash
pyuic5 -o src/ui/main_window_ui.py src/ui/main_window.ui
```

> 注意：如使用 Qt6，则使用 `pyuic6`。

### 3. 在 controller.py 中加载并绑定 UI

```python
from ui.main_window_ui import Ui_MainWindow

class MainController:
    def __init__(self):
        self.window = QMainWindow()
        self.ui = Ui_MainWindow()
        self.ui.setupUi(self.window)

        # 示例：将自定义频谱控件插入到 UI 占位容器中
        layout = QVBoxLayout(self.ui.spectrumArea)
        layout.addWidget(SpectrumDisplay())
```

* 自定义控件如 `SpectrumDisplay` 仍然写在 `display.py` 中。
* UI 层与功能模块解耦，便于分工协作与维护。

---

如需自动批量转换 `.ui` 文件，可使用：

```bash
python build_ui.py
```
