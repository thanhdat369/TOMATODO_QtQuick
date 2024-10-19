import QtQuick
import QtQuick.Layouts

import "../style"

Rectangle {
	id: circleBox

	implicitWidth: 250
	implicitHeight: 250

	color: "transparent"

	radius: width * 0.5

	property int secondRemain: 1
	property int originalTime: 1
	property alias isRunning: timer.running

	Canvas {
		id: circleCanvas
		anchors.fill: parent


		// TODO Refactor this code
		onPaint: {
			let ctx = getContext("2d");
			let x = width / 2;
			let y = height / 2;

			var start = Math.PI * (-90 / 180);

			let percentComplete = ((circleBox.originalTime - circleBox.secondRemain) * 1.0 / circleBox.originalTime);

			let endArcPercent = Math.min(percentComplete * 360, 360);

			var end = Math.PI * ((endArcPercent - 90) / 180);
			var endOfCircle = Math.PI * ((360 - 90) / 180);

			ctx.reset();

			// draw the border outside

			ctx.beginPath();

			ctx.arc(x, y, (width / 2), start, endOfCircle, false);

			ctx.lineWidth = 1;
			ctx.strokeStyle = ColorStyle.mainColor;

			ctx.stroke();
			ctx.closePath();

			// draw the border inside
			ctx.beginPath();

			ctx.arc(x, y, (width / 2) - _.lineWidth , start, endOfCircle, false);

			ctx.lineWidth = 1;
			ctx.strokeStyle = ColorStyle.mainColor;;

			ctx.stroke();
			ctx.closePath();

			// draw tomatodo

			ctx.beginPath();

			ctx.arc(x, y, (width / 2) - _.lineWidth / 2, start, end, false);

			ctx.lineWidth = _.lineWidth;
			ctx.strokeStyle = ColorStyle.mainColor;

			ctx.stroke();
			ctx.closePath();



		}
	}
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
				circleBox.secondRemain -= 1;
				circleCanvas.requestPaint();

				if(secondRemain <= 0) {
					timer.stop();
				}
			}
		}
	}

	QtObject {
		id: _

		property bool isPlaying: timer.running

		property url iconScr: isPlaying ? "qrc:assets/icon/pause.svg" : "qrc:assets/icon/play-button.svg"

		property real lineWidth: 30

		function showString(secondRemain) {
			let min = Math.floor(secondRemain / 60);
			let second = secondRemain - min * 60;

			let minToShow = (min >= 10 ? "" : "0") + min.toString();
			let secondToShow = (second >= 10 ? "" : "0") + second.toString();

			return minToShow + ":" + secondToShow;
		}
	}
}
