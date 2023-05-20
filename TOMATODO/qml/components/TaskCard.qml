import QtQuick 2.15
import QtQuick.Layouts 1.12
import "../style"

Rectangle {
	id: root

	property string taskID: "0"
	property string taskName: "0"

	width: 431
	height: 50

	radius: 16

	color: ColorStyle.mainColor01

	RowLayout {
		spacing: 10
		anchors.verticalCenter: parent.verticalCenter
		RoundTick {
			id: roundTick

			Layout.alignment: Qt.AlignCenter
			Layout.leftMargin: 20

			onClicked: {
				root.state = root.state == "check" ? "uncheck" : "check";
			}
		}

		TextEdit {
			id: taskNameEdit

			selectByMouse: true
			Layout.fillWidth: true

			font.bold: true
			font.family: "Inter"
			font.pixelSize: 12

			text: root.taskName
		}
	}

	RowLayout {
		anchors.right: root.right

		DeadlineBox {
			id: deadlineBox

			Layout.preferredHeight: root.height
			Layout.preferredWidth: 50
		}

		PomodoroInfoTaskCard {
			id: pomodoroInfo

			Layout.preferredHeight: root.height
			Layout.preferredWidth: 40
		}
	}
	states: [
		State {
			name: "check"
			PropertyChanges {
				target: roundTick
				isDone: true
			}
			PropertyChanges {
				target: taskNameEdit
				font.strikeout: true
				readOnly:true
			}
		},
		State {
			name: "uncheck"
			PropertyChanges {
				target: roundTick
				isDone: false
			}
			PropertyChanges {
				target: taskNameEdit
				font.strikeout: false
			}

		}

	]
}
