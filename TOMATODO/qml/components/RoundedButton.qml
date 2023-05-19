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

	Rectangle {
		id: button

		implicitWidth: 100
		implicitHeight: 30
		radius: 10

		color: internal.buttonColor

		Text {
			id: buttonText

			anchors.centerIn: parent
			text: root.text
		}
	}

	QtObject {
		id: internal
		property color buttonColor: {
			if (root.style === RoundedButton.ButtonStyle.AcceptButton) {
				return ColorStyle.lightColor;
			} else if(root.style === RoundedButton.ButtonStyle.CancelButton) {
				return ColorStyle.darkColor;
			}
			return ColorStyle.mainColor01
		}

	}
}
