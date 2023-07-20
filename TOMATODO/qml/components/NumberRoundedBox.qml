import QtQuick 2.15
import '../style'
Rectangle {
	id: root

	property alias numberText: numberLabel.text
	color: "transparent"
	border.width: 2
	border.color: ColorStyle.mainColor
	implicitWidth: 60
	implicitHeight: 80
	radius: 10

	TextEdit {
		id: numberLabel

		anchors.centerIn: parent

		font.family: FontStyle.ubuntuMonoBold.name
		font.pixelSize: 30
		font.styleName: "normal"
		color: ColorStyle.mainColor

		text: "0"
	}
}
