import QtQuick 2.15
import Qt.labs.platform 1.1

SystemTrayIcon {
	id: sysTray

	visible: true
	icon.source: "qrc:/assets/icon/tomato.ico"

	tooltip: "TOMATODO APP RUNNING"

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
