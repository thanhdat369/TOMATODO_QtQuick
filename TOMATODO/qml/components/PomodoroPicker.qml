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
	property int taskId: -1

	signal okButtonClicked()

	function calculateTime() {
		let sec = parseInt(firstSecField.text) * 10 + parseInt(secondSecField.text);
		let min = parseInt(firstMinField.text) * 10 + parseInt(secondMinField.text);

		return min * 60 + sec;
	}

	Component.onCompleted: {
		taskLabel.forceActiveFocus();
	}

	implicitWidth: 400
	implicitHeight: 300
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

			text: _.title
		}

		ColumnLayout {
			anchors.centerIn: rectangleMain
			spacing: 20

			RowLayout {
				// TODO: separate to new component
				Layout.alignment: Qt.AlignCenter
				spacing: 10

				NumberRoundedBox {
					id: firstMinField
					nextFocusObject: secondMinField
					text: "3"
				}

				NumberRoundedBox {
					id: secondMinField
					nextFocusObject: firstSecField
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

				NumberRoundedBox {
					id: firstSecField
					nextFocusObject: secondSecField
				}

				NumberRoundedBox {
					id: secondSecField
				}
			}

			Rectangle {

				implicitHeight: 36
				implicitWidth: 300
				clip: true

				border.color: ColorStyle.mainColor
				color: "transparent"
				radius: 20

				Layout.alignment: Qt.AlignCenter

				TextEdit {
					id: taskLabel
					anchors.centerIn: parent

					font.family: FontStyle.ubuntuMonoBold.name
					font.pixelSize: 24
					color: ColorStyle.mainColor

					text: "Test"
				}
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

				text: qsTr("OK")
				onClicked: {
					root.okButtonClicked();
				}
			}

			RoundedButton {
				id: cancelButton
				style: RoundedButton.ButtonStyle.CancelButton

				text: qsTr("Cancel")

				onClicked: {
					root.close();
				}
			}
		}
	}

	QtObject {
		id: _

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

