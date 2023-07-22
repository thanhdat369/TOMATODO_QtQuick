import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.15

import "qml/style"
import "qml/components"
import "qml/screen"

Window {
	id: main_window
	width: 500
	height: 500

	minimumWidth: 500
	minimumHeight: 500

	maximumWidth: 800
	maximumHeight: 500


	visible: true
	title: qsTr("TOMATODO App")

	color: ColorStyle.backgroundColor

	HomeScreen {
		anchors.fill: parent
		tomatodoModel: myModel
	}
}
