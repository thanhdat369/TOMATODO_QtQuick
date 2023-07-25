import QtQuick 2.15
import QtGraphicalEffects 1.15
import "../style"

Item {
	id: root

	property color color: ColorStyle.mainColor
	property color hoverColor: ColorStyle.lightColor
	property string iconSrc: "qrc:assets/icon/plus.svg"
	property alias hovered: iconArea.containsMouse

	width: 20
	height: 20

	signal clicked()

	Rectangle {
		id: box

		width: root.width
		height: root.height

		color: "transparent"

		Image {
			id: iconButton

			width: box.width
			height: box.height

			anchors.centerIn: parent.Center
			source: root.iconSrc

			MouseArea {
				id: iconArea

				anchors.fill: parent
				hoverEnabled: true

				onClicked: {
					root.clicked();
				}
			}
		}

		ColorOverlay {
			anchors.fill: iconButton
			source:iconButton
			color: attributes.iconColor
			antialiasing: true
		}
	}

	QtObject {
		id: attributes

		property color iconColor: {
			if(iconArea.containsMouse) {
				return root.hoverColor;
			}
			return root.color;
		}

	}
}
