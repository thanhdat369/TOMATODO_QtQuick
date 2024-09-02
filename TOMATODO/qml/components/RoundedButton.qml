import QtQuick 2.15
import "../style"

Item {
	id: root

	implicitWidth: button.width
	implicitHeight: button.height

	enum ButtonStyle {
		AcceptButton,
		CancelButton
	}
	property int style: RoundedButton.ButtonStyle.AcceptButton
	property string text: "OK"

	signal clicked()

	Rectangle {
		id: button

		implicitWidth: 100
		implicitHeight: 30
		radius: 20

		border.width: 2
		border.color: _.borderButtonColor

		color: "transparent"

		Text {
			id: buttonText

			font.family: FontStyle.ubuntuMonoBold.name
			font.pixelSize: 20
			anchors.centerIn: parent
			color: _.buttonColor

			text: root.text
		}
	}

	MouseArea {
		id: mouseArea
		hoverEnabled: true
		anchors.fill: parent

		onClicked: {
			root.clicked();
		}
	}

	QtObject {
		id: _
		property color buttonColor: {
			if (root.style === RoundedButton.ButtonStyle.AcceptButton) {
				return ColorStyle.mainColor;
			} else if(root.style === RoundedButton.ButtonStyle.CancelButton) {
				return ColorStyle.textColor;
			}
			return ColorStyle.mainColor01
		}

		property color borderButtonColor: {
			if (mouseArea.containsMouse) {
				return ColorStyle.mainHoverColor;
			}

			if (root.style === RoundedButton.ButtonStyle.AcceptButton) {
				return ColorStyle.mainColor;
			} else if(root.style === RoundedButton.ButtonStyle.CancelButton) {
				return ColorStyle.textColor;
			}
			return ColorStyle.mainColor;
		}

	}
}
