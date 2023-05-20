import QtQuick 2.15
import QtQuick.Layouts 1.15
import "../style"

Rectangle {
	id: root
	color: ColorStyle.mainColor
	implicitWidth: 50

	property string deadlineTime: "2pm"
	ColumnLayout {
		anchors.centerIn: parent
		spacing: 6

		Text {
			id: deadlineText

			font.family: "Inter"
			font.pixelSize: 10

			font.bold: true
			color: ColorStyle.lightColor

			text: qsTr("Deadline")
		}

		Text {
			id: time

			Layout.margins: 6

			font.family: "Inter"
			font.bold: true
			font.pixelSize: 10

			color: ColorStyle.lightColor

			text: root.deadlineTime
		}
	}
}
