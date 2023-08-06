import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import "layout"
import "../components"
import "../style"

Item {
	id: root

	property alias tomatodoModel: listItem.model

	signal onItemClick

	ColumnLayout {
		id: colummBig
		width: root.width

		spacing: 15

		TopLayout {
			id: topLayout

			Layout.fillWidth: true

			hasBackButton: false

			onSettingClick: {
				settingLoader.active = true;
			}
		}

		DatePicker {
			id: datePicker
			Layout.alignment: Qt.AlignCenter
		}

	}

	IconButton {
		id: iconPlus
		anchors.top: colummBig.bottom
		anchors.right: listItem.right

		onClicked: {
			pickerPopup.open();
		}
	}

	PomodoroPicker {
		id: pickerPopup
		anchors.centerIn: parent

		onOkButtonClicked: {
			let timeOrigin = pickerPopup.calculateTime();
			if(root.tomatodoModel && timeOrigin) {
				root.tomatodoModel.addNewTask(pickerPopup.taskName,timeOrigin);
				pickerPopup.close();
			}
		}
	}

	ListView {
		id: listItem

		anchors.top: iconPlus.bottom
		anchors.topMargin: 15
		anchors.horizontalCenter: root.horizontalCenter

		width: 435
		height: root.height - colummBig.height

		model: tomatodoModel

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

			onRemoveTask: {
				if(model) {
					tomatodoModel.deleteItem(model.id);
				}
			}

			onItemClick: {
				internal.currentModel = model
				poromodoLoader.active = true;
			}

			onDoneClick: {
				if(model) {
					tomatodoModel.tickDoneTask(model.id, taskCard.isDone);
				}
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

				onBackClick: {
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
