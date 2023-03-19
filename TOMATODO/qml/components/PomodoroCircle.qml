import QtQuick 2.15

Rectangle{
	id:  circletimeline
	width: 233
	height: 233

	anchors.verticalCenter: parent.verticalCenter
	anchors.horizontalCenter: parent.horizontalCenter

	color: ColorStyle.mainColor

	radius: width*0.5
	Column{
		spacing: 10

		anchors.verticalCenter: parent.verticalCenter
		anchors.horizontalCenter: parent.horizontalCenter

		Rectangle {
			id: recoftimeline

			width: 106
			height: 42

			color: "transparent"
			Text {
				id: timeline

				anchors.verticalCenter: parent.verticalCenter
				anchors.horizontalCenter: parent.horizontalCenter

				font.family: "Inter"
				font.pixelSize: 35
				font.bold: true

				color: ColorStyle.lightColor

				text: qsTr("30:00")
			}
		}
		Rectangle{
			id: recofplaybutton

			width: 21
			height: 16

			anchors.horizontalCenter: parent.horizontalCenter

			color: "transparent"

			IconButton{
				id: playbutton

				iconSrc: "qrc:assets/icon/play-button.svg"

				color: ColorStyle.lightColor
			}
		}
	}
}
