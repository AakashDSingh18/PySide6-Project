'''FIRST CODE'''
# import sys
# from PySide6.QtWidgets import QApplication, QLabel
# #QApplication is like manager of everything happening here from start to exec()
# app = QApplication(sys.argv)
# label = QLabel("Hello World!")
# label.show()
# app.exec()

'''Signals & Slots'''
# import sys
# from PySide6.QtWidgets import QApplication, QLabel, QPushButton
# from PySide6.QtCore import Slot
# # Slot is like Functionality or Service that is going to be executed after a "signal" connected to it responds
# @Slot() 
# def buttonAct():
#     print("BUTTONNN CLICKEDDDD !!")

# app = QApplication(sys.argv)
# but1= QPushButton("Touch Me Please!")
# # "clicked" is a signal inside PushButton which responds in when button is clicked
# # "connect" is a connector or a wiring to make connection between a Signal & a Slot
# but1.clicked.connect(buttonAct)
# but1.show()
# app.exec()


# import sys
# from PySide6.QtWidgets import QApplication, QLabel, QToolButton, QLineEdit
# from PySide6.QtCore import Slot
# app= QApplication(sys.argv)
# butt = QToolButton("Clear")
# textbar= QLineEdit("Write something here")
# butt.clicked.connect(textbar.clear)
# butt.show()
# textbar.show()
# app.exec()

import sys
from PySide6.QtWidgets import QApplication, QLabel, QToolButton, QLineEdit

