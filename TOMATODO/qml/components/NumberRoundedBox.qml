import QtQuick 2.15
import '../style'
Rectangle {
	id: root

	property alias numberText: numberLabel.text
	color: ColorStyle.mainColor01
	implicitWidth: 50
	implicitHeight: 50
	radius: 5

	TextEdit {
		id: numberLabel

		anchors.centerIn: parent

		color: ColorStyle.textDarkColor

		text: "0"
	}
}
