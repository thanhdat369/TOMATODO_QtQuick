import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import "layout"
import "../components"
Item{
	id: root

	property alias tomatodoModel: listItem.model

	ColumnLayout {
		id: colummBig
		width: root.width

		spacing: 10

		TopLayout {
			id: topLayout

			Layout.fillWidth: true

			hasBackButton: false
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
	}

	ListView {
		id: listItem

		anchors.top: iconPlus.bottom
		anchors.topMargin: 15
		anchors.horizontalCenter: root.horizontalCenter

		width: 435
		height: root.height - colummBig.height

		orientation: ListView.Vertical

		ScrollBar.vertical: ScrollBar {
			active: true
		}

		model: tomatodoModel

		spacing: 15

		delegate: TaskCard {
			taskID: model.id
			taskName: model.name
		}
	}
}
