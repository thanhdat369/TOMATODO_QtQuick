import QtQuick
import QtQuick.Layouts
import "../style"

Item {
	id: root

	implicitHeight: 30
	implicitWidth: 260

	property alias selectedDate: tomatodoCalendar.selectedDate

	RowLayout {
		Layout.fillWidth: true
		Layout.fillHeight: true
		anchors.horizontalCenter: root.horizontalCenter
		spacing: 5

		Rectangle {
			Layout.preferredWidth: 150
			Layout.preferredHeight: root.height
			border {
				color: _.color
			}
			radius: 20

			color: "transparent"

			Text {
				id: dateTimeText

				anchors.centerIn: parent

				font.family: FontStyle.ubuntuMonoRegular.name
				color: _.color

				text: root.selectedDate.toDateString();

			}
		}
	}

	TomatodoCalendar {
		id: tomatodoCalendar
	}

	MouseArea {
		id: mouseArea
		anchors.fill: parent
		hoverEnabled: true

		onClicked: {
			tomatodoCalendar.open();
		}
	}

	QtObject {
		id: _

		property color color: mouseArea.containsMouse ? ColorStyle.textColor : ColorStyle.mainColor

		function getToday() {
			let date = new Date()

		}
	}
}
