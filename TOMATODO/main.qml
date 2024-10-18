import QtQuick.Controls

import "qml/style"
import "qml/components"
import "qml/screen"

ApplicationWindow {
	id: main_window

	width: 500
	height: 500

	minimumWidth: 500
	minimumHeight: 500

	maximumWidth: 800
	maximumHeight: 500

	visible: true // need it because the tray system

	title: qsTr("TOMATODO")

	color: ColorStyle.backgroundColor

	onClosing: {
		main_window.hide();
	}

	HomeScreen {
		anchors.fill: parent
		tomatodoModel: dataModel // TaskCardItemList.h
	}

	TomatodoSystemTrayIcon {
		id: tomatodoSysTrayIcon
	}
}
