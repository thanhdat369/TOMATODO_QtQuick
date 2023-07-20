import QtQuick 2.15
import QtQuick.Layouts 1.15
import "../style"
Item {
	id: root

	implicitWidth: 300
	property string deadlineTime: "30 min"
	property color backgroundColor: ColorStyle.mainColor
	property color textColor: ColorStyle.lightColor
	Rectangle {
		id: overlayRec
		width: mainRectangle.radius
		height: mainRectangle.height
		color: mainRectangle.color
		anchors.top: mainRectangle.top
	}

	Rectangle {
		id: mainRectangle
		color: root.backgroundColor

		width: root.width
		height: root.height

		radius: 20

		ColumnLayout {
			anchors.centerIn: parent
			spacing: 6

			Text {
				id: deadlineText

				Layout.fillWidth: true

				font.family: FontStyle.ubuntuMonoRegular.name
				font.pixelSize: 16

				font.bold: true
				color: root.textColor

				text: qsTr("2pm")
			}

			Text {
				id: time

				font.family: FontStyle.ubuntuMonoRegular.name
				font.bold: true
				font.pixelSize: 12

				color: root.textColor

				text: root.deadlineTime
			}
		}
	}
}
