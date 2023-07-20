import QtQuick 2.15
import QtQuick.Layouts 1.15
import "../style"


Rectangle{
	id: circleBox

	implicitWidth: 250
	implicitHeight: 250

	color: "transparent"
	border.color: ColorStyle.mainColor
	border.width: 3

	radius: width * 0.5

	property int secondRemain: 20

	ColumnLayout{
		anchors.centerIn: circleBox

		Rectangle {
			id: recoftimeline

			Layout.alignment: Qt.AlignCenter

			width: 106
			height: 42

			color: "transparent"
			Text {
				id: timeline
				font.family: "Inter"
				font.pixelSize: 35
				font.bold: true

				color: ColorStyle.mainColor

				text: internal.showString(circleBox.secondRemain)
			}
		}

		IconButton{
			id: playbutton

			Layout.alignment: Qt.AlignCenter

			iconSrc: internal.iconScr

			color: ColorStyle.mainColor

			onClicked: {
				if(circleBox.secondRemain > 0) {
					if (timer.running) {
						timer.stop();
					} else {
						timer.start();
					}
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
		id: internal

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
