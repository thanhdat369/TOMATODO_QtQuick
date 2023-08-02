import QtQuick 2.15
import QtQuick.Layouts 1.12
import "../style"

Rectangle {
	id: root

	property string taskID: "0"
	property string taskName: "0"
	property int remainTime: 0
	property int originalTime: 0
//	property QtObject taskCardItemmodel: null

	signal itemClick()
	signal removeTask()

	implicitWidth: 431
	implicitHeight: 50

	border.width: 1
	border.color: internal.cardColor

	radius: 20

	color: "transparent"

	RowLayout {
		spacing: 10
		anchors.verticalCenter: parent.verticalCenter

		RoundTick {
			id: roundTick

			Layout.alignment: Qt.AlignCenter
			Layout.leftMargin: 20

			color: internal.cardColor

			onClicked: {
				root.state = root.state == "check" ? "uncheck" : "check";
			}
		}

		TextEdit {
			id: taskNameEdit

			selectByMouse: true
			Layout.fillWidth: true

			font.bold: true
			font.family: FontStyle.ubuntuMonoRegular.name
			font.pixelSize: 14

			color: internal.cardColor

			text: root.taskName
		}
	}

	DeadlineBox {
		id: deadlineBox

		anchors.right: root.right
		implicitHeight: root.height
		width: 70
		deadlineTime: root.originalTime

		backgroundColor: internal.cardColor

		MouseArea {
			anchors.fill: parent
			hoverEnabled: true

			onClicked: {
				root.itemClick();
			}
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

	MouseArea {
		id: mouseArea

		anchors.fill: parent
		hoverEnabled: true
		propagateComposedEvents: true
	}

	IconButton {
		id: deleteButton

		anchors.right: deadlineBox.right
		y: -10

		visible: mouseArea.containsMouse || deleteButton.hovered

		iconSrc: "qrc:/assets/icon/close.svg"

		onClicked: {
			root.removeTask();
		}
	}

	QtObject {
		id: internal

		property color cardColor: {
			if(mouseArea.containsMouse){
				return ColorStyle.mainHoverColor;
			}

			return root.state == "check" ?  ColorStyle.secondaryColor:ColorStyle.mainColor;
		}
	}
}
