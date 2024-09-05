import QtQuick
import QtQuick.Layouts
import "../style"

Rectangle {
	id:root

	color: "transparent"

	ColumnLayout {
		id: lastelement
		anchors.centerIn: parent

		spacing: 3

		Rectangle {
			id: secondcircle

			width: 25
			height: 25

			radius: width *0.5

			color: ColorStyle.mainColor
		}

		Text {
			id: text2
			Layout.fillWidth: true

			font.bold: true
			font.family: "Inter"
			font.pixelSize: 7

			color: ColorStyle.textDarkColor

			text: qsTr("30 min")
		}
	}
}
