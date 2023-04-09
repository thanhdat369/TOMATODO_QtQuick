import QtQuick 2.15
import QtQuick.Layouts 1.15
import "layout"
import "../components"
import "../style"

Item{
	id: root

	property string taskName: "Task Tomatodo"

	ColumnLayout {
		width: root.width

		spacing: 10

		TopLayout {
			id: topLayout

			Layout.fillWidth: true
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

				font.family: "Inter"
				font.bold: true
				font.pixelSize: 16
				font.styleName: "normal"
				color: ColorStyle.textLightColor

				text: root.taskName
			}
		}
	}
}
