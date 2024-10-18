import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import '../style'

Popup {
	id: root

	implicitHeight: 250
	implicitWidth: 300
	modal: true
	property var selectedDate: _.getToday();
	background: Rectangle {
		color: "transparent"
		radius: 20

	}

	CalendarCustom {
		id: calendar
		anchors.fill: parent
		width: root.width
		height: root.height
		day: selectedDate.getDate()
		month: selectedDate.getMonth()
		year: selectedDate.getFullYear()
	}

	QtObject {
		id: _

		function getToday() {
			return new Date();
		}
	}
}
