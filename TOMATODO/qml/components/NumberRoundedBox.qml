import QtQuick 2.15
import QtQuick.Controls 2.15
import '../style'
Rectangle {
	id: root

	property alias text: numberLabel.text
	color: "transparent"
	border.width: 2
	border.color: ColorStyle.mainColor
	implicitWidth: 60
	implicitHeight: 80
	radius: 10

	TextInput{
		id: numberLabel

		anchors.centerIn: parent

		font.family: FontStyle.ubuntuMonoBold.name
		font.pixelSize: 30
		font.styleName: "normal"
		color: ColorStyle.mainColor
		validator: IntValidator {bottom: 0 ;top:99}

		text: "0"

		onTextChanged: {
			if(numberLabel.text.length > 1)
			{
				console.log(numberLabel.cursorPosition);
				if(numberLabel.cursorPosition == 1) {
					numberLabel.remove(1,2);
				}
				else {
					numberLabel.remove(0,1);
				}
			}
		}
	}
}
