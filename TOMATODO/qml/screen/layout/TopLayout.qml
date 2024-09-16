import QtQuick
import QtQuick.Layouts
import '../../components'

ColumnLayout {
	id: root

	property bool hasSettingButton: true
	property bool hasBackButton: true
	property bool hasAppTitle: true

	signal backClicked()
	signal settingClicked()

	spacing: _.topMargin

	Item {
		id: buttonLayout

		Layout.fillWidth: true
		Layout.topMargin: _.topMargin
		Layout.leftMargin: _.sideMargin
		Layout.rightMargin: _.sideMargin

		IconButton {
			id: backButton

			visible: root.hasBackButton

			anchors.left: parent.left
			implicitWidth: _.iconWidth
			implicitHeight: _.iconHeight

			iconSrc: "qrc:assets/icon/arrow-back.svg"

			onClicked: {
				root.backClicked();
			}
		}

		IconButton {
			id: settingButton

			visible: root.hasSettingButton

			anchors.right: parent.right
			implicitWidth: _.iconWidth
			implicitHeight: _.iconHeight

			iconSrc: "qrc:assets/icon/settings.svg"

			onClicked: {
				root.settingClicked();
			}
		}
	}

	TitleApp {
		id: appTitle

		visible: root.hasAppTitle

		Layout.alignment: Qt.AlignCenter
	}

	QtObject {
		id: _

		readonly property int iconHeight: 30
		readonly property int iconWidth: 30

		readonly property int topMargin: 15
		readonly property int sideMargin: 30
	}
}
