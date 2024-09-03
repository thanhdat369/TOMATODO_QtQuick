import QtQuick
import QtQuick.Controls
import "../style"

//TODO
Rectangle {
	id: root

	color: "black"
	signal dayClicked();

	property bool isSelected: false
	property bool isToday: false

	implicitHeight: 30
	implicitWidth: 30

	radius: 30

	MouseArea {
		id: _hover
		anchors.fill: parent
		hoverEnabled: true

		onClicked: {
			root.dayClicked();
		}

	}

	QtObject {
		id: _
		property color borderColor: {
			if (_hover.containsMouse) {
				return ColorStyle.mainHoverColor;
			}

			if (root.isSelected) {
				return ColorStyle.lightColor;
			}

			if (root.isToday) {
				return ColorStyle.mainColor;
			}
			return "transparent";
		}
	}
}
