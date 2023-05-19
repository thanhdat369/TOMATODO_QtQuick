import QtQuick 2.15
import QtQuick.Layouts 1.15
import "../style"

Rectangle {
	id: root
	color: ColorStyle.mainColor
	implicitWidth: 400
	implicitHeight: 300
	radius: 20

	property string taskName: "Task Name Can Edit"

	ColumnLayout {
		anchors.centerIn: parent
		spacing: 20

		Layout.fillWidth: true
		Layout.fillHeight: true
		Layout.preferredWidth: 400
		Layout.preferredHeight: 300

//		RowLayout {
//			spacing: 10

//			NumberRoundedBox{
//				id: firstMinField

//			}

//			NumberRoundedBox{
//				id: secondMinField
//			}

//			Rectangle {
//				implicitWidth: 10
//				implicitHeight: 50
//				color: "transparent"

//				Text {
//					anchors.centerIn: parent
//					text: ":"
//					color: "white"
//				}
//			}

//			NumberRoundedBox{
//				id: firstSecField
//			}

//			NumberRoundedBox{
//				id: secondSecField
//			}
//		}

//		Text {
//			Layout.alignment: Qt.AlignCenter
//			id: taskLabel
//			text: root.taskName
//		}

		Item {
			Layout.fillHeight: true
			Layout.fillWidth: true
		}

		RoundedButton {
			Layout.alignment: Qt.AlignBottom
			style: RoundedButton.ButtonStyle.CancelButton
			text: "Cancel"
		}

//		RowLayout {
//			id: buttonLayout
//			spacing: 10
//			Layout.fillWidth: true
//			Layout.preferredHeight: okButton.height

//			Layout.alignment: Qt.AlignBottom

//			Item {
//				Layout.fillWidth: true
//			}

//			RoundedButton {
//				id: okButton
//				Layout.alignment: Qt.AlignRight
//				text: "OK"
//			}

//			RoundedButton {
//				Layout.alignment: Qt.AlignRight
//				style: RoundedButton.ButtonStyle.CancelButton
//				text: "Cancel"
//			}
//		}
	}
}
