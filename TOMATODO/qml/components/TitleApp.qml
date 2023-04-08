import QtQuick 2.15

Rectangle{
	id: root
	width:344
	height: 36
	color: "transparent"
	property color textColor: "white"
	property string text: "TOMATODO"


	Text {
		id: headTitle
		anchors.horizontalCenter : parent.horizontalCenter

		color: root.textColor

		font.family: "Inter"
		font.bold: true
		font.pixelSize: 30
		font.styleName: "normal"
		lineHeight: 30

		text: qsTr(root.text)
	}
}
