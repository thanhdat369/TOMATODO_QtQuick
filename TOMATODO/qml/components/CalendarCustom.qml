import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "../style"

Rectangle {
	id: root

	anchors.fill: parent
	width: parent.width
	border {
		width: 1
		color: ColorStyle.darkColor
	}
	radius: 10
	color: ColorStyle.backgroundColor

	property int day: 1
	property int month: 1
	property int year: 2000

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
			month: root.month
			year: root.year
			locale: Qt.locale("en_US")
			delegate: CalendarDayCustom{
				opacity: model.month === allDayOfMonth.month ? 1 : 0
				dayNum: model.day
				isToday: _.isToday(model.day, model.month, model.year);
			}

		}
	}


	QtObject {
		id: _

		function isToday(_day, _month, _year) {
			let toDay = new Date();
			let toDateDay = toDay.getDate();
			let toDateMonth = toDay.getMonth();
			let toDateYear = toDay.getFullYear();

			return _day === toDateDay &&
					_month === toDateMonth &&
					_year === toDateYear
		}
	}


}
