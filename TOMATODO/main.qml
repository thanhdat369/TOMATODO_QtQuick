import QtQuick 2.15
import QtQuick.Window 2.15

import "qml/style"
import "qml/components"

Window {
	width: 500
	height: 500
	visible: true
	title: qsTr("TOMATODO App")

	color: ColorStyle.mainColor

//	AddTaskButton {
//		id: addButton

//		width: 20
//		height: 20

//		color: ColorStyle.mainColor01

//	}
	PomodoroCircle{
		color: ColorStyle.mainColor01
	}
}
