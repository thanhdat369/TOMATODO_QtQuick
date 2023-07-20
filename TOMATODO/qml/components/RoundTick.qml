import QtQuick 2.15

Rectangle {
	id: root

	implicitWidth: 25
	implicitHeight: 25

	radius: width * 0.5

	property bool isDone: false

	signal clicked()

//	Image {
//		id: iconTicked

//		visible: isDone

//		width: root.width
//		height: root.height

//		anchors.centerIn: parent.Center

//		source: "qrc:assets/icon/tick.svg"
//	}

	MouseArea {
		id: mouseArea
		anchors.fill: parent
		hoverEnabled: true

		onClicked: {
			root.clicked();
		}
	}
}
