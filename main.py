import sys
import os
import PySide6.QtWidgets as side6
from PySide6.QtCore import Qt, QUrl, Slot
from PySide6.QtQuickWidgets import QQuickWidget

class WelcomePage(side6.QWidget):
    def __init__(self):
        super().__init__()

        #Style Sheet Design for elements
        self.lbl_qss= """
        QLabel{
            color:#2C3E50;
            font-size: 24px;
            font-weight: 800;
            font-family: 'Segoe UI', Arial;
            }
        """
        self.btn_qss= """
        QPushButton{
            background-color: #3498DB;
            color: white;
            font-weight: bold;
            font-size: 14px;
            border-radius: 8px;
            padding: 8px;
        }
        QPushButton:hover{
            background-color: #2980B9;
        }
        QPushButton:pressed{
            background-color: #1A5276;
        }
        """
        self.parent_layout= side6.QHBoxLayout(self)

        self.frame_1= side6.QFrame()
        self.frame_1.setFixedWidth(420)
        self.frame_1.setStyleSheet("""
            QFrame {
                background-color: #1E1E1E;
            }
        """)

        self.box_layoutV= side6.QVBoxLayout(self.frame_1)
        self.box_layoutV.setSpacing(0)
        self.box_layoutV.setContentsMargins(0,0,0,0)
        
        self.frame_11= side6.QFrame()
        self.frame_11.setFixedSize(415,50)
        self.loginBtn_layoutH= side6.QHBoxLayout(self.frame_11)

        self.lbl_1= side6.QLabel("Welcome to PySide6 Practice")
        self.lbl_1.setStyleSheet(self.lbl_qss)
        self.btn_1= side6.QPushButton("LOGIN")
        self.btn_1.setStyleSheet(self.btn_qss)
        self.btn_2= side6.QPushButton("REGISTER")
        self.btn_2.setStyleSheet(self.btn_qss)
        # self.box_layoutV.addStretch()
        self.box_layoutV.addWidget(self.lbl_1,alignment=Qt.AlignmentFlag.AlignCenter)
        self.loginBtn_layoutH.addWidget(self.btn_1)
        self.loginBtn_layoutH.addWidget(self.btn_2)
        self.box_layoutV.addWidget(self.frame_11, alignment=Qt.AlignmentFlag.AlignTop)
        # self.box_layoutV.addStretch()
        self.parent_layout.addStretch()
        self.parent_layout.addWidget(self.frame_1)
        self.parent_layout.setSpacing(0)
        self.parent_layout.setContentsMargins(0,0,0,0)

class HomePage(side6.QWidget):
    def __init__(self):
        super().__init__()
        self.layout= side6.QVBoxLayout(self)
        self.lbl_1= side6.QLabel("This is the Home Screen Of out App")
        self.bkbtn= side6.QPushButton("BACK")
        self.layout.addStretch()
        self.layout.addWidget(self.lbl_1)
        self.layout.addWidget(self.bkbtn)
        self.layout.addStretch()


class Main(side6.QWidget):
    def __init__(self):
        super().__init__()
        ##############################################################################
        # --- QML ENGINE SETUP ---                                                  
        self.qml_bg = QQuickWidget()
        self.qml_bg.setResizeMode(QQuickWidget.ResizeMode.SizeRootObjectToView)
        
        current_directory = os.path.dirname(os.path.abspath(__file__))
        qml_file_path = os.path.join(current_directory, "background.qml")
        self.qml_bg.setSource(QUrl.fromLocalFile(qml_file_path))                  
        
        qml_root = self.qml_bg.rootObject()
        if qml_root is not None:
            # Connect the new signal to our Python function
            qml_root.keyClicked.connect(self.handle_isometric_key)
        else:
            print("⚠️ qml_root is None. Check the red error above!")        
        ##############################################################################


        self.setObjectName("MainWindow")
        self.setStyleSheet("""
            #MainWindow{
                background-color: #121212;  
            }
        """)

        self.setWindowTitle("PySide6 Practice")

        #Page creation as Objects to attach together
        self.welcome_page= WelcomePage()
        self.home_page= HomePage()

        #Attaching all pages in StackedWidget
        self.stackofWidget= side6.QStackedWidget()
        self.stackofWidget.addWidget(self.welcome_page)
        self.stackofWidget.addWidget(self.home_page)

        #QVBoxLayout to manage the perticular space in Vertically ordered Widgets
        self.allLayout= side6.QVBoxLayout(self.qml_bg)
        self.allLayout.addWidget(self.stackofWidget)
        self.allLayout.setContentsMargins(0, 0, 0, 0)

        self.welcome_page.btn_1.clicked.connect(self.go_to_HomePage)
        self.home_page.bkbtn.clicked.connect(self.go_to_WelcomePage)

        self.main_layout = side6.QVBoxLayout(self)
        self.main_layout.setContentsMargins(0,0,0,0)
        self.main_layout.setSpacing(0)
        self.main_layout.addWidget(self.qml_bg)
    
    @Slot(str)
    def handle_isometric_key(self, key_name):
        print(f"PYTHON TERMINAL: The QML engine just clicked the '{key_name}' key!")
        
        # You can now write real Python logic here!
        if key_name == "Ctrl":
            print("Initiating Control sequence...")
        elif key_name == "Del":
            print("Deleting data...")
    def go_to_WelcomePage(self):
        self.stackofWidget.setCurrentIndex(0)
    def go_to_HomePage(self):
        self.stackofWidget.setCurrentIndex(1)

if __name__== "__main__":
    app = side6.QApplication(sys.argv)
    screen = Main()
    screen.showMaximized()
    app.exec()
