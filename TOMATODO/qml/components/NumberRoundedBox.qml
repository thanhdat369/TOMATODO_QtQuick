import QtQuick
import QtQuick.Controls

import '../style'

Rectangle {
	id: root

	implicitWidth: 60
	implicitHeight: 80

	border {
		width: 2
		color: _.borderColor
	}

	radius: 10
	color: "transparent"

	signal enterPressed;


	property alias text: numberLabel.text
	property alias inputObject: numberLabel
	property QtObject nextFocusObject: null

	TextInput {
		id: numberLabel

		anchors.centerIn: parent

		font.family: FontStyle.ubuntuMonoBold.name
		font.pixelSize: 30
		font.styleName: "normal"

		validator: IntValidator {bottom: 0 ;top:10}

		color: _.borderColor

		text: "0"

		onTextChanged: {
			// only accept number < 10
			if(numberLabel.text.length > 1)
			{
				if(numberLabel.cursorPosition == 1) {
					numberLabel.remove(1,2);
				}
				else {
					numberLabel.remove(0,1);
				}

				// Move to next box
				if (root.nextFocusObject) {
					root.nextFocusObject.inputObject.forceActiveFocus();
				} else {
					focus = false;
				}
			}
		}
		Keys.onReturnPressed: {
			root.enterPressed();
		}
	}

	QtObject {
		id: _
		property color borderColor: numberLabel.focus ? ColorStyle.mainHoverColor
													  : ColorStyle.mainColor
	}
}
