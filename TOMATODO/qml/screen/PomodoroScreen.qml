import QtQuick
import QtQuick.Layouts

import "layout"
import "../components"
import "../style"

Rectangle {
	id: root

	property alias timeRemain: poromodoCircle.secondRemain
	property alias isRunning: poromodoCircle.isRunning

	property QtObject taskModel: null

	color: ColorStyle.backgroundColor

	signal backClick();
	signal settingClick();

	ColumnLayout {
		width: root.width

		spacing: 10

		TopLayout {
			id: topLayout

			Layout.fillWidth: true

			hasBackButton: !root.isRunning
			hasAppTitle: true
			hasSettingButton: true

			onBackClicked: {
				root.backClick();
			}

			onSettingClicked: {
				root.settingClick();
			}
		}

		ColumnLayout {
			spacing: 10

			Layout.fillWidth: true
			Layout.alignment: Qt.AlignCenter
			Layout.topMargin: 30

			PomodoroCircle {
				id: poromodoCircle
				secondRemain: root.taskModel ? root.taskModel.timeRemain : 0
			}

			Text {
				id: taskName

				Layout.alignment: Qt.AlignCenter

				font.bold: true
				font.pixelSize: 30
				color: ColorStyle.mainColor
				font.family: FontStyle.ubuntuMonoBold.name

				text: root.taskModel ? root.taskModel.name : "No name"
			}
		}
	}
}
