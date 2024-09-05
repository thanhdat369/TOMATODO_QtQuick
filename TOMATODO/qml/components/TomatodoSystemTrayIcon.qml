import QtQuick
import Qt.labs.platform

SystemTrayIcon {
	id: sysTray

	visible: true
	icon.source: "qrc:/assets/icon/tomato.ico"

	tooltip: qsTr("TOMATODO APP RUNNING")

	onActivated: {
		main_window.show();
		main_window.raise();
	}

	menu: Menu {
		MenuItem {
			text: qsTr("Show")
			onTriggered: main_window.show();
		}
		MenuItem {
			text: qsTr("Quit")
			onTriggered: Qt.quit();
		}
	}
}
