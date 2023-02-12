import QtQuick 2.15
import "../style"

Rectangle {
	id: task

	width: 431
	height: 47

	anchors.horizontalCenter: parent.horizontalCenter
	anchors.top: parent.top
	anchors.topMargin: 10
	radius: 16

	color: ColorStyle.mainColor01

	Row {

		Rectangle {
			id: circlewhite

			width: 23
			height: 23

			anchors.top: parent.top
			anchors.topMargin: 12
			anchors.left: parent.left
			anchors.leftMargin: 14
			radius: width*0.5

			color: "#FDF9F9"

		Rectangle {
			width: 96
			height: 20

			anchors.verticalCenter: parent.verticalCenter
			anchors.left: parent.left
			anchors.leftMargin: 54

			color: "transparent"

		Text {
			id: task2022

			anchors.horizontalCenter: parent.horizontalCenter
			anchors.verticalCenter: parent.verticalCenter

			color: ColorStyle.textDarkColor
			font.family: "Inter"
			font.pixelSize:  12
			font.bold: true

			text: qsTr("The task 2022")
		}
		}
		Rectangle {
			id: deadline

			width: 38
			height: 47

			anchors.verticalCenter: parent.verticalCenter
			anchors.left: parent.left
			anchors.leftMargin: 345

			color: ColorStyle.mainColor

				Rectangle {
					id: recofdeadline
					width: 31
					height: 18

					anchors.verticalCenter: parent.verticalCenter
					anchors.horizontalCenter: parent.horizontalCenter
					anchors.top: parent.top
					anchors.topMargin: 10

					color: "transparent"

						Text {
							id: textdeadline

							anchors.horizontalCenter: parent.horizontalCenter

							font.family: "Inter"
							font.pixelSize: 7
							font.bold: true

							color: ColorStyle.lightColor

							text: qsTr("Deadline")
					}
				}

				Rectangle {
					id: recoftimeline

					width: 25
					height: 12

					anchors.horizontalCenter: parent.horizontalCenter
					anchors.top:  parent.top
					anchors.topMargin: 24

					color:"transparent"
					Text {
						id: time

						anchors.horizontalCenter: parent.horizontalCenter
						anchors.verticalCenter: parent.verticalCenter

						font.family: "Inter"
						font.pixelSize: 10
						font.bold: true

						color: ColorStyle.lightColor

						text: qsTr("2pm")
				}
			}
		}
		Rectangle {
			id: timelinecircle

			width: 22
			height: 22

			anchors.left: parent.left
			anchors.leftMargin: 390

			radius: width*0.5

			color: ColorStyle.mainColor
		}
		Rectangle {
			width: 24
			height: 8

			anchors.top: parent.top
			anchors.topMargin: 22
			anchors.left: parent.left
			anchors.leftMargin: 389

			color: "transparent"

			Text {
				id: timeline

				anchors.verticalCenter: parent.verticalCenter
				anchors.horizontalCenter: parent.horizontalCenter

				font.family: "Inter"
				font.bold: true
				font.pixelSize: 7

				color: ColorStyle.textDarkColor

				text: qsTr("30 min")
			}
		}
		}
	}
}
