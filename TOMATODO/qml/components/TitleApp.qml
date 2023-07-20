import QtQuick 2.15
import "../style"
Rectangle {
	id: root
	width: 344
	height: headTitle.height
	color: "transparent"
	property color textColor: ColorStyle.mainColor
	property string text: "TOMATODO"

	Text {
		id: headTitle
		anchors.horizontalCenter : parent.horizontalCenter

		color: root.textColor

		font.family: FontStyle.ubuntuMonoBold.name
		font.pixelSize: 45

		text: qsTr(root.text)
	}
}
