import os
import sys
import subprocess
import argparse
import re

def convert_ui_to_py(ui_file, output_py=None):
    if not ui_file.endswith(".ui"):
        print("❌ 输入文件必须是 .ui 文件")
        return None

    if not os.path.exists(ui_file):
        print(f"❌ 文件不存在: {ui_file}")
        return None

    if output_py is None:
        output_py = os.path.splitext(ui_file)[0] + ".py"

    try:
        # 1. 生成临时中间 .py 文件
        temp_output = output_py + ".tmp"
        subprocess.run(["pyuic5", "-o", temp_output, ui_file], check=True)

        with open(temp_output, "r", encoding="utf-8") as f:
            code = f.read()

        # 2. 提取 Ui_ 类名
        match = re.search(r'class\s+(Ui_\w+)\s*\(', code)
        class_name = match.group(1) if match else "Ui_MainWindow"

        # 3. 判断 QMainWindow 还是 QDialog
        window_type = "QMainWindow" if ".setCentralWidget(" in code else "QDialog"

        # 4. 生成 main 入口代码
        main_code = f"""
if __name__ == "__main__":
    import sys
    from PyQt5.QtWidgets import QApplication, {window_type}

    app = QApplication(sys.argv)
    window = {window_type}()
    ui = {class_name}()
    ui.setupUi(window)
    window.show()
    sys.exit(app.exec())
"""

        # 5. 写入目标文件并添加 main
        with open(output_py, "w", encoding="utf-8") as f:
            f.write(code.strip() + "\n\n" + main_code.strip())

        os.remove(temp_output)
        print(f"✅ 成功生成并添加入口：{output_py}")
        return output_py
    except subprocess.CalledProcessError as e:
        print("❌ 转换失败，请确认 pyuic5 是否已安装")
        print(e)
        return None

def preview_py_file(py_file):
    try:
        print(f"\n🚀 正在运行预览: {py_file}")
        subprocess.run(["python", py_file])
    except Exception as e:
        print("❌ 运行失败：")
        print(e)

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="将 .ui 文件转换为可直接运行的 .py 文件")
    parser.add_argument("ui_file", nargs="?", default="design.ui", help="输入 .ui 文件（默认：design.ui）")
    parser.add_argument("-o", "--output", help="输出 .py 文件名（默认与 .ui 同名）")
    parser.add_argument("-p", "--preview", action="store_true", help="转换后立即运行预览")

    args = parser.parse_args()

    output_py = convert_ui_to_py(args.ui_file, args.output)
    if output_py and args.preview:
        preview_py_file(output_py)