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
		border.color: internal.borderButtonColor

		color: "transparent"

		Text {
			id: buttonText

			font.family: FontStyle.ubuntuMonoBold.name
			font.pixelSize: 20
			anchors.centerIn: parent
			color: ColorStyle.lightColor

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
		id: internal
		property color buttonColor: {
			if (root.style === RoundedButton.ButtonStyle.AcceptButton) {
				return ColorStyle.lightColor;
			} else if(root.style === RoundedButton.ButtonStyle.CancelButton) {
				return ColorStyle.darkColor;
			}
			return ColorStyle.mainColor01
		}

		property color borderButtonColor: {
			if (root.style === RoundedButton.ButtonStyle.AcceptButton) {
				return ColorStyle.mainColor;
			} else if(root.style === RoundedButton.ButtonStyle.CancelButton) {
				return ColorStyle.lightColor;
			}
			return ColorStyle.mainColor01
		}

	}
}
