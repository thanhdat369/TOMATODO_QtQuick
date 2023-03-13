import QtQuick 2.15
import QtQuick.Layouts 1.12
import "../style"

Rectangle {
	id: titlerec

	width: 431
	height: 47

	anchors.horizontalCenter: parent.horizontalCenter
	Layout.fillWidth: true


	radius: 16

	color: ColorStyle.mainColor01
	RowLayout {

		Layout.margins: parent
		Layout.alignment: Qt.AlignHCenter|Qt.AlignVCenter

		Rectangle {
			id: firstcircle

			Layout.fillWidth: true
			Layout.leftMargin: 14

			width: 23
			height: 23

			radius: width*0.5
		}
		Text {
			id: task2022

			Layout.fillWidth: true
			Layout.leftMargin: 17

			font.bold: true
			font.family: "Inter"
			font.pixelSize: 12

			text: qsTr("The task 2022")
		}
		Rectangle {
			id: cover

			width: 38
			height: 47
			Layout.leftMargin: 204

			color: ColorStyle.mainColor

		ColumnLayout {
			spacing: 6
			id: deadlineandtime

			Layout.alignment: Qt.AlignHCenter

			Text {
				id: deadlinetext

				Layout.alignment: Qt.AlignHCenter
				Layout.margins: 3

				font.family: "Inter"
				font.pixelSize: 7

				color: ColorStyle.lightColor

				text: qsTr("deadline")
			}
			Text {
				id: time

				Layout.alignment: Qt.AlignHCenter
				Layout.margins: 6

				font.family: "Inter"
				font.bold: true
				font.pixelSize: 10

				color: ColorStyle.lightColor

				text: qsTr("2pm")
			}
		}
		}
		ColumnLayout {
			id: lastelement

			spacing: 3
			Rectangle {
				id: secondcircle

				width: 22
				height: 22

				radius: width*0.5
				color: ColorStyle.mainColor
			}
			Text {
				id: text2
				Layout.fillWidth: true

				font.bold: true
				font.family: "Inter"
				font.pixelSize: 7

				color: ColorStyle.textDarkColor

				text: qsTr("30min")
			}
		}
	}
}
