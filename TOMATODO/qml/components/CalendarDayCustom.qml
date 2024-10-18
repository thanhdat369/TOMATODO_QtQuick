//CalendarDayCustom.qml
import QtQuick
import QtQuick.Controls
import "../style"

Rectangle {
	id: root

	color: "transparent"
	signal dayClicked();

	property bool isSelected: false
	property bool isToday: false
	property int dayNum: 1

	implicitHeight: 30
	implicitWidth: 30

	radius: 30

	border.color: _.borderColor

	Text {
		id: dayNum
		anchors.fill: parent
		verticalAlignment: Text.AlignVCenter
		horizontalAlignment: Text.AlignHCenter

		color: ColorStyle.lightColor
		text: root.dayNum.toString()
	}

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
