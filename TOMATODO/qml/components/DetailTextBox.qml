import QtQuick 2.15

Rectangle {
	width: 436
	height: 105

	anchors.verticalCenter: parent.verticalCenter
	anchors.horizontalCenter: parent.horizontalCenter

	radius: 20
	opacity: 0.5

	color: ColorStyle.mainColor

	Item {
		id: textbox

		width: 436
		height: 105

		property string wrap: "Text.WordWrap"
		property real topwidth:300
		property string label:"This is task about..."
		property color paint: ColorStyle.lightColor

		Rectangle {
			id: recoftext

			width: 152
			height: 52

			anchors.top: parent.top
			anchors.topMargin: 13
			anchors.left: parent.left
			anchors.leftMargin: 14

			color: "transparent"

			Text {
				id: template

				width:topwidth

				color: textbox.paint

				wrapMode: textbox.wrap

				font.bold: true
				font.family: "Inter"
				font.pixelSize: 10

				text:textbox.label
			}
		}
	}
}
