import QtQuick 2.15
import '../style'

Rectangle {
	id: root

	implicitWidth: 25
	implicitHeight: 25

	radius: width * 0.5

	property bool isDone: false

	signal clicked()

	Image {
		id: iconTicked

		visible: isDone

		width: root.width
		height: root.height

		anchors.centerIn: parent.Center

		source: "qrc:assets/icon/tick.svg"
	}

    // TODO try to remove
    // ColorOverlay {
    // 	anchors.fill: iconTicked
    // 	visible: iconTicked.visible
    // 	source:iconTicked
    // 	antialiasing: true
    // 	color: ColorStyle.backgroundColor
    // }

	MouseArea {
		id: mouseArea
		anchors.fill: parent
		hoverEnabled: true

		onClicked: {
			root.clicked();
		}
	}
}
