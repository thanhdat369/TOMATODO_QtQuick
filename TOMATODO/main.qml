import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.12

import "qml/style"
import "qml/components"

Window {
	width: 500
	height: 500
	visible: true
	title: qsTr("TOMATODO App")

	color: ColorStyle.mainColor
	TaskCard{

	}
}
