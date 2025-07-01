# build_ui.py
import os
import subprocess

UI_DIR = "src/ui"

def compile_ui_files():
    for filename in os.listdir(UI_DIR):
        if filename.endswith(".ui"):
            ui_path = os.path.join(UI_DIR, filename)
            py_path = os.path.join(UI_DIR, filename.replace(".ui", "_ui.py"))

            print(f"[build_ui] Converting {filename} -> {os.path.basename(py_path)}")
            result = subprocess.run(
                ["pyuic5", "-o", py_path, ui_path],
                stdout=subprocess.PIPE,
                stderr=subprocess.PIPE,
                text=True
            )

            if result.returncode != 0:
                print(f"[build_ui] Error compiling {filename}:\n{result.stderr}")
            else:
                print(f"[build_ui] Success.")

if __name__ == "__main__":
    compile_ui_files()
