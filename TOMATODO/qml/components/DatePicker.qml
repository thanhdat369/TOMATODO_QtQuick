import QtQuick 2.15
import QtQuick.Layouts 1.15
import "../style"

Item {
	id: root

	height: 20
	width: 260
	property alias selectedDate: tomatodoCalendar.selectedDate
	RowLayout {
		id: dayRowLayout
		Layout.fillWidth: true
		Layout.fillHeight: true
		anchors.horizontalCenter: root.horizontalCenter
		spacing: 5

		Rectangle {
			id: backIconBox

			Layout.preferredHeight: root.height
			Layout.preferredWidth: 30

			color: "transparent"

			IconButton {
				id: iconBackButton

				iconSrc: "qrc:assets/icon/arrow-back.svg"
				color: internal.color
			}
		}

		Rectangle {
			color: "transparent"

			Layout.preferredWidth: 100
			Layout.preferredHeight: root.height

			Text {
				id: dateTimeText

				anchors.centerIn: parent

				font.family: FontStyle.ubuntuMonoRegular.name
				color: internal.color

				text: root.selectedDate.toDateString();

			}
		}

		Rectangle{
			id: fowardIconBox

			Layout.preferredHeight: root.height
			Layout.preferredWidth: 30

			color: "transparent"

			IconButton {
				id: iconFowardButton

				iconSrc: "qrc:assets/icon/arrow-foward.svg"
				color: internal.color
			}
		}
	}
	MouseArea {
		id: mouseArea
		anchors.fill: parent
		hoverEnabled: true

		onClicked: {
			tomatodoCalendar.open();
		}
	}
	TomatodoCalendar {
		id: tomatodoCalendar
	}

	QtObject {
		id: internal

		property color color: mouseArea.containsMouse ? ColorStyle.lightColor : ColorStyle.mainColor
	}
}
