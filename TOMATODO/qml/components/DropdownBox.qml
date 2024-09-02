import QtQuick 2.0
import QtQuick.Controls 2.0
import "../style"

ComboBox {
	id: root

	implicitHeight: 30
	implicitWidth: 200

	delegate: ItemDelegate {
		width: root.width

		contentItem: Text {
			verticalAlignment: Text.AlignVCenter
			horizontalAlignment: Text.AlignHCenter

			font.family: FontStyle.ubuntuMonoBold.name
			color: root.highlightedIndex === index ? ColorStyle.lightColor :ColorStyle.mainColor

			text: modelData

		}

		background: Rectangle {
			color: root.highlightedIndex === index ? ColorStyle.mainColor : ColorStyle.backgroundColor
			border.color: ColorStyle.mainColor
			border.width: 1
			radius: 15
		}
	}


	indicator: IconButton {
		id: dropdownIcon

		x: (root.width - dropdownIcon.width - dropdownIcon.y)
		y: (root.height - dropdownIcon.height)/2
		iconSrc: "qrc:/assets/icon/down.svg"

		width: 15
		height: 15

		onClicked: {
			dropdownPopup.open();
		}
	}


	contentItem: Item {
		Text {
			id: textMain
			anchors.centerIn: parent
			text: root.displayText

			font.pixelSize: 16
			font.family: FontStyle.ubuntuMonoBold.name
			color: ColorStyle.mainColor
		}
	}


	background: Rectangle {
		id: backgroundMain

		border.width: 2
		border.color: ColorStyle.mainColor
		radius: 20

		color: "transparent"
	}


	popup: Popup {
		id: dropdownPopup
		width: root.width
		implicitHeight: contentItem.width
		padding: 0


		contentItem: ListView {
			implicitHeight: contentItem.height
			model: root.popup.visible ? root.delegateModel : null
			currentIndex: root.highlightedIndex
		}

		background: Rectangle {
			color: "transparent"
			radius: 10
		}
	}

	QtObject {
		id: _

		property color backgroundColor: ColorStyle.backgroundColor
		property color borderColor: ColorStyle.backgroundColor
		property color textColor: ColorStyle.mainColor
		property color textInDropdownPopupColor: ColorStyle.mainColor
		property color backgroundPopupColor: ColorStyle.mainColor
	}
}

