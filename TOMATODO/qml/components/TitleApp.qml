import QtQuick 2.15
import "../style"

Rectangle {
	id: root

	property string title: qsTr("TOMATODO")
	property color textColor: ColorStyle.mainColor

	implicitWidth: 344
	height: headTitle.height
	color: "transparent"

	Text {
		id: headTitle
		anchors.horizontalCenter : parent.horizontalCenter

		color: root.textColor

		font.family: FontStyle.ubuntuMonoBold.name
		font.pixelSize: 45

		text: root.title
	}
}
