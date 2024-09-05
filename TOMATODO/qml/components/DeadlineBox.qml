import QtQuick

import "../style"

Item {
	id: root

	implicitWidth: 300

	property int workedTime: 0
	property int deadlineTime: 0

	property color backgroundColor: ColorStyle.mainColor
	property color textColor: ColorStyle.lightColor

	Rectangle {
		id: overlayRec
		// This rectange placed on top of the esclip main rectangle
		// to make the bullet like this
		//     -------
		//    | 20 min )
		//     -------

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

		Text {
			id: time

			anchors.centerIn: parent

			font.family: FontStyle.ubuntuMonoRegular.name
			font.bold: true
			font.pixelSize: 14

			color: root.textColor

			text: _.convertToMin(root.deadlineTime, root.workedTime)
		}
	}

	QtObject {
		id: _

		function convertToMin(originalTimeSec, workedTimeSec) {
			let originalTimeMin = Math.ceil(originalTimeSec / 60);
			let workedTimeMin = Math.ceil(workedTimeSec / 60);
			return workedTimeMin.toString()
					+ "/" + originalTimeMin.toString()
					+ " " + qsTr("min");
		}
	}
}
