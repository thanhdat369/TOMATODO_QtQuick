import QtQuick 2.15
import QtQuick.Layouts 1.15
import '../../components'
import "../../style"

ColumnLayout {
	id: root

	property bool hasSettingButton: true
	property bool hasBackButton: true
	property bool hasAppTitle: true

	spacing: internal.topMargin

	Item {
		id: buttonLayout

		Layout.fillWidth: true
		Layout.topMargin: internal.topMargin
		Layout.leftMargin: internal.sideMargin
		Layout.rightMargin: internal.sideMargin

		IconButton {
			id: backButton

			visible: root.hasBackButton

			anchors.left: parent.left
			implicitWidth: internal.iconWidth
			implicitHeight: internal.iconHeight

			iconSrc: "qrc:assets/icon/arrow-back.svg"
		}

		IconButton {
			id: settingButton

			visible: root.hasSettingButton

			anchors.right: parent.right
			implicitWidth: internal.iconWidth
			implicitHeight: internal.iconHeight

			iconSrc: "qrc:assets/icon/settings.svg"
		}
	}

	TitleApp {
		id: appTitle

		visible: root.hasAppTitle

		Layout.alignment: Qt.AlignCenter
	}

	QtObject {
		id: internal

		readonly property int iconHeight: 30
		readonly property int iconWidth: 30

		readonly property int topMargin: 15
		readonly property int sideMargin: 30
	}
}
