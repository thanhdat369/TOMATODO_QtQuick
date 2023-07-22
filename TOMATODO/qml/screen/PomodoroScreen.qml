import QtQuick 2.15
import QtQuick.Layouts 1.15
import "layout"
import "../components"
import "../style"

Rectangle {
	id: root

	property string taskName: "Task Tomatodo"

	color: ColorStyle.backgroundColor

	signal backClick();
	signal settingClick();

	ColumnLayout {
		width: root.width

		spacing: 10

		TopLayout {
			id: topLayout

			Layout.fillWidth: true

			onBackClick: {
				root.backClick();
			}

			onSettingClick: {
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
			}

			Text {
				id: taskName

				Layout.alignment: Qt.AlignCenter

				font.bold: true
				font.pixelSize: 30
				color: ColorStyle.mainColor
				font.family: FontStyle.ubuntuMonoBold.name

				text: root.taskName
			}
		}
	}
}
