import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

import "layout"
import "../components"

Item {
	id: root

	// TaskCardItemList.cpp
	property alias tomatodoModel: listItem.model

	property alias popUpMode: pickerPopup.taskMode

	signal onItemClick

	ColumnLayout {
		id: colummBig
		width: root.width

		spacing: 15

		TopLayout {
			id: topLayout

			Layout.fillWidth: true

			hasAppTitle: true
			hasSettingButton: true

			onSettingClicked: {
				settingLoader.active = true;
			}
		}

		DatePicker {
			id: datePicker
			Layout.alignment: Qt.AlignCenter
		}

	}

	IconButton {
		// Add task button
		id: iconPlus
		anchors.top: colummBig.bottom
		anchors.right: listItem.right

		onClicked: {
			pickerPopup.taskMode = PomodoroPicker.TaskMode.Create;
			pickerPopup.open();
		}
	}

	PomodoroPicker {
		id: pickerPopup
		anchors.centerIn: parent

		onOkButtonClicked: {
			let timeOrigin = pickerPopup.calculateTime();

			if(!root.tomatodoModel || !timeOrigin) {
				return;
			}

			if (pickerPopup.taskMode === PomodoroPicker.TaskMode.Edit) {
				root.tomatodoModel.updateTask(taskId,pickerPopup.taskName,timeOrigin);
				pickerPopup.taskId = -1;
				pickerPopup.close();
			}
			else if (pickerPopup.taskMode === PomodoroPicker.TaskMode.Create) {
				root.tomatodoModel.addNewTask(pickerPopup.taskName,timeOrigin);
				pickerPopup.close();
			}
		}
	}

	ListView {
		id: listItem

		anchors{
			top: iconPlus.bottom
			topMargin: 15
			horizontalCenter: root.horizontalCenter
		}

		width: 435
		height: root.height - colummBig.height

		model: root.tomatodoModel

		orientation: ListView.Vertical

		ScrollBar.vertical: ScrollBar {
			active: false
		}

		spacing: 15

		delegate: TaskCard {
			id: taskCard
			taskID: model.id
			taskName: model.name
			originalTime: parseInt(model.originalTime)
			remainTime: parseInt(model.timeRemain)
			isDone: model.isDone

			required property var model

			onRemoveTask: {
				if (!model) {
					return;
				}

				root.tomatodoModel.deleteItem(model.id);
			}

			onItemClick: {
				internal.currentModel = model
				poromodoLoader.active = true;
			}

			onDoneClick: {
				if (!model) {
					return;
				}

				console.log("isDone", isDone);

				root.tomatodoModel.tickDoneTask(model.id, taskCard.isDone);
			}

			onDoubleClicked: {
				pickerPopup.taskMode = PomodoroPicker.TaskMode.Edit;
				pickerPopup.taskId = model.id;
				pickerPopup.open();
			}
		}
	}

	Loader {
		id: poromodoLoader
		anchors.fill: parent

		active: false
		sourceComponent: poromodoScreenComponent

		Component {
			id: poromodoScreenComponent

			PomodoroScreen {
				id: pomodoroScreen

				anchors.fill: parent
				taskModel: internal.currentModel ? internal.currentModel : null

				onBackClick: {
					root.tomatodoModel.updateTimeRemain(internal.currentModel.id, pomodoroScreen.timeRemain);
					poromodoLoader.active = false;
				}

				onSettingClick:  {
					settingLoader.active = true;
				}
			}
		}
	}

	Loader {
		id: settingLoader
		anchors.fill: parent
		active: false
		sourceComponent: settingScreenComponent

		Component {
			id: settingScreenComponent

			SettingsScreen {
				id: settingScreen

				anchors.fill: parent

				onBackClicked: {
					settingLoader.active = false
				}
			}
		}
	}

	QtObject {
		id: internal

		property int currentIndex: 0
		property QtObject currentModel: null
	}
}
