# QAMSignalProcessing

## 📆 项目结构

```
src/
├── controller.py        # 应用主控制器（程序入口）
├── receiver.py          # 数据接收模块（TCP Server）
├── processor.py         # IQ 转频谱处理模块
├── display.py           # 频谱绘图（PyQt + pyqtgraph）
├── buffer.py            # 简单线程安全缓冲区
├── ui/                  # QtDesigner 生成的 UI 文件与转换文件
tests/
├── iq_test_client.py    # 模拟客户端，定时发送 IQ 测试数据
build_ui.py              # 将 .ui 文件转换为 Python 模块
```

---

## 🚀 启动方式

开发时从项目根目录启动：

```bash
python ./src/controller.py
```

依赖库：

```bash
pip install pyqt5 pyqtgraph numpy
```

---

## 🥪 测试客户端（模拟 IQ 数据）

用于测试接收与频谱处理流程：

```bash
python tests/iq_test_client.py
```

说明：

* 通过 TCP 主动连接 `127.0.0.1:5000`
* 每秒发送 50 帧，每帧 2048 字节（1024 组 IQ）
* IQ 数据为 8bit（有符号）交错排列（I,Q,I,Q,...）

---

## 🔁 Qt Designer UI 集成方式

* `.ui` 文件保存在 `src/ui/` 中
* 使用 `build_ui.py` 自动将其转换为 Python 代码：

```bash
python build_ui.py
```

在主程序中以类继承形式集成 UI：

```python
from src.ui.main_window_ui import Ui_MainWindow

class MainWindow(QMainWindow, Ui_MainWindow):
    def __init__(self):
        super().__init__()
        self.setupUi(self)
```

---

## 👥 协作者 Git 提交与协作流程

本项目远程仓库：

```
https://github.com/pxxxlll/QAMSignalProcessing.git
```

### 克隆项目：

```bash
git clone https://github.com/pxxxlll/QAMSignalProcessing.git
cd QAMSignalProcessing
```

### 初始提交：

```bash
git checkout -b your_branch_name
git add .
git commit -m "描述你的修改"
git push -u origin your_branch_name
```

### 后续提交：

```bash
git add .
git commit -m "更新内容"
git push
```

> 建议为每个功能模块单独开分支，最终通过 Pull Request 合并。

---

## 🛠️ TODO

* [ ] 明确：下位机是 TCP Server 还是 Client（当前默认下位机为 TCP 客户端，主动连接）
* [ ] 明确：IQ 数据格式是 `int8`（有符号）还是 `uint8`（无符号）

```
```
