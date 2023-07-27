import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../style"

Popup {
	id: root

	enum TaskMode {
		Create,
		Edit
	}
	property alias taskName: taskLabel.text

	property int taskMode: PomodoroPicker.TaskMode.Edit

	signal okButtonClicked()

	function calculateTime() {
		console.log(firstSecField.text);
		let sec = parseInt(firstSecField.text) * 10 + parseInt(secondSecField.text);
		let min = parseInt(firstMinField.text) * 10 + parseInt(secondMinField.text);

		return min * 60 + sec;
	}

	implicitWidth: 400
	implicitHeight: 250
	modal: true

	background: null

	contentItem: Rectangle {
		id: rectangleMain
		implicitWidth: root.width
		implicitHeight: root.height
		color: ColorStyle.backgroundColor
		border.color: ColorStyle.mainColor
		border.width: 3
		radius: 20

		Text {
			id: title
			anchors.top: rectangleMain.top
			anchors.left: rectangleMain.left
			anchors.topMargin: 20
			anchors.leftMargin: 20

			font.family: FontStyle.ubuntuMonoBold.name
			font.pixelSize: 30
			font.styleName: "normal"

			color: ColorStyle.mainColor

			text: internal.title
		}

		ColumnLayout {
			anchors.centerIn: rectangleMain
			spacing: 20

			RowLayout {
				Layout.alignment: Qt.AlignCenter
				spacing: 10

				NumberRoundedBox{
					id: firstMinField
					text: "3"
				}

				NumberRoundedBox{
					id: secondMinField
				}

				Rectangle {
					implicitWidth: 10
					implicitHeight: 50
					color: "transparent"

					Text {
						anchors.centerIn: parent
						text: ":"
						color: ColorStyle.mainColor
						font.pixelSize: 30
					}
				}

				NumberRoundedBox{
					id: firstSecField
				}

				NumberRoundedBox{
					id: secondSecField
				}
			}

			TextEdit {
				id: taskLabel
				Layout.alignment: Qt.AlignCenter

				font.family: FontStyle.ubuntuMonoBold.name
				font.pixelSize: 24
				color: ColorStyle.mainColor

				text: "Test"
			}
		}

		RowLayout {
			id: buttonLayout
			spacing: 10

			anchors.right: rectangleMain.right
			anchors.bottom: rectangleMain.bottom

			anchors.rightMargin: 20
			anchors.bottomMargin: 20

			Layout.fillWidth: true

			RoundedButton {
				id: okButton
				text: "OK"
				onClicked: {
					root.okButtonClicked();
				}
			}

			RoundedButton {
				id: cancelButton
				style: RoundedButton.ButtonStyle.CancelButton
				text: "Cancel"

				onClicked: {
					root.close();
				}
			}
		}
	}

	QtObject {
		id: internal

		property string title: {
			if (root.taskMode === PomodoroPicker.TaskMode.Edit) {
				return qsTr("Edit Task");
			} else if (root.taskMode === PomodoroPicker.TaskMode.Create) {
				return qsTr("Create Task");
			}

			return qsTr("Title");
		}
	}
}

