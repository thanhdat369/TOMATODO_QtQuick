import QtQuick 2.15
import QtGraphicalEffects 1.15
import "../style"

Item {
	id: root

	property color color: "white"
	property string iconSrc: "qrc:assets/icon/plus.svg"

	anchors.centerIn: parent

	width: 20
	height: 20

	Rectangle {
		id: box

		width: root.width
		height: root.height

		color: "transparent"

		Image {
			id: iconButton

			width: box.width
			height: box.height

			anchors.centerIn: parent.Center
			source: root.iconSrc
		}

		ColorOverlay{
			anchors.fill: iconButton
			source:iconButton
			color: root.color
			antialiasing: true
		}
	}
}
