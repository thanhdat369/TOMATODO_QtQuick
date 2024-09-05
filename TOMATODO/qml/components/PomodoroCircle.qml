import QtQuick
import QtQuick.Layouts

import "../style"

Rectangle {
	id: circleBox

	implicitWidth: 250
	implicitHeight: 250

	color: "transparent"
	border.color: ColorStyle.mainColor
	border.width: 3

	radius: width * 0.5

	property int secondRemain: 20
	property alias isRunning: timer.running

	ColumnLayout {
		anchors.centerIn: circleBox

		Rectangle {
			id: timeline

			Layout.alignment: Qt.AlignCenter

			implicitWidth: 106
			implicitHeight: 42

			color: "transparent"

			Text {
				font.family: "Inter"
				font.pixelSize: 35
				font.bold: true

				color: ColorStyle.mainColor

				text: _.showString(circleBox.secondRemain)
			}
		}

		IconButton {
			id: playbutton

			Layout.alignment: Qt.AlignCenter

			iconSrc: _.iconScr

			color: ColorStyle.mainColor

			onClicked: {
				if (circleBox.secondRemain <= 0) {
					return;
				}

				if (timer.running) {
					timer.stop();
				} else {
					timer.start();
				}
			}
		}

		Timer {
			id: timer

			interval: 1000
			repeat: true

			onTriggered: {
				circleBox.secondRemain -= 1

				if(secondRemain <= 0) {
					timer.stop()
				}
			}
		}
	}

	QtObject {
		id: _

		property bool isPlaying: timer.running

		property url iconScr: isPlaying ? "qrc:assets/icon/pause.svg" : "qrc:assets/icon/play-button.svg"

		function showString(secondRemain) {
			let min = Math.floor(secondRemain / 60)
			let second = secondRemain - min * 60

			let minToShow = (min >= 10 ? "" : "0") + min.toString()
			let secondToShow = (second >= 10 ? "" : "0") + second.toString()

			return minToShow + ":" + secondToShow;
		}
	}
}
