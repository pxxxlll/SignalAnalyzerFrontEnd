# main.py
from PyQt5.QtWidgets import QApplication
from controller import MainController
import sys

if __name__ == "__main__":
    app = QApplication(sys.argv)
    controller = MainController()
    controller.window.show()
    sys.exit(app.exec_())
