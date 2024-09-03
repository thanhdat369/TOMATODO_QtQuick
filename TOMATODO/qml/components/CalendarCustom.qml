import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "../style"

Rectangle {
	id: root

	anchors.fill: parent
	width: parent.width
	border {
		width: 2
		color: ColorStyle.lightColor
	}
	radius: 10
	color: "transparent"

	ColumnLayout {
		anchors.fill: parent
		spacing: 0
		DayOfWeekRow {
			Layout.fillWidth: true
			delegate: Text {
					id: monthName
					horizontalAlignment: Text.AlignHCenter
					verticalAlignment: Text.AlignVCenter
					text: model.shortName
					color: ColorStyle.mainColor
			}
		}

		MonthGrid {
			id: allDayOfMonth

			Layout.fillWidth: true
			Layout.fillHeight: true
			// TODO Fix hard code
			month: 9
			year: 2024
			locale: Qt.locale("en_US")
			delegate: Text {
				horizontalAlignment: Text.AlignHCenter
				verticalAlignment: Text.AlignVCenter
				opacity: model.month === allDayOfMonth.month ? 1 : 0
				text: model.day
				// TODO isToday => month.day == ?
			}
		}
	}


}
