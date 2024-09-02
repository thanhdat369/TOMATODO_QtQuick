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

    // property alias selectedDate: calendar.selectedDate

    // TODO fix calendar in qt6
    // Calendar {
    // 	id: calendar

    // 	anchors.centerIn: parent

    // 	width: root.width
    // 	height: root.height

    // 	style: CalendarStyle {
    // 		gridVisible: false

    // 		background: Rectangle {
    // 			width: calendar.width
    // 			color: ColorStyle.backgroundColor
    // 		}
    // 		navigationBar: Rectangle {
    // 			width: calendar.width
    // 			height: 30
    // 			color: ColorStyle.backgroundColor

    // 			RowLayout {
    // 				anchors.centerIn: parent

    // 				IconButton {
    // 					id: backMonthButton

    // 					implicitWidth: 10
    // 					implicitHeight: 10

    // 					iconSrc: "qrc:/assets/icon/arrow-back.svg"

    // 					color: ColorStyle.textColor
    // 					hoverColor: ColorStyle.mainColor

    // 					onClicked: {
    // 						calendar.showPreviousMonth();
    // 					}
    // 				}
    // 				Label {
    // 					Layout.leftMargin: 10
    // 					Layout.rightMargin: 10

    // 					text: styleData.title
    // 					color: ColorStyle.textColor
    // 				}

    // 				IconButton {
    // 					id: nextMonthButton

    // 					implicitWidth: 10
    // 					implicitHeight: 10

    // 					iconSrc: "qrc:/assets/icon/arrow-foward.svg"
    // 					color: ColorStyle.textColor
    // 					hoverColor: ColorStyle.mainColor
    // 					onClicked: {
    // 						calendar.showNextMonth();
    // 					}
    // 				}
    // 			}
    // 		}

    // 		dayOfWeekDelegate: Rectangle {
    // 			height: 30
    // 			color: ColorStyle.backgroundColor
    // 			Label {
    // 				anchors.centerIn: parent
    // 				text:  control.locale.dayName(styleData.dayOfWeek, control.dayOfWeekFormat)
    // 				color: ColorStyle.textColor
    // 			}
    // 		}

    // 		dayDelegate: Rectangle {
    // 			color: ColorStyle.backgroundColor
    // 			visible: styleData.visibleMonth

    // 			Rectangle {
    // 				width: dayLabel.font.pixelSize * 2
    // 				height: width
    // 				border.color: _.getDayBorderColor(styleData)

    // 				radius: width / 2
    // 				color: "transparent"
    // 				anchors.centerIn: parent
    // 			}


    // 			Label {
    // 				id: dayLabel
    // 				text: styleData.date.getDate()
    // 				anchors.centerIn: parent
    // 				color: ColorStyle.textColor
    // 			}

    // 			MouseArea {
    // 				id: dayMouseArea

    // 				anchors.fill: parent
    // 				preventStealing: true
    // 				propagateComposedEvents: true

    // 				onClicked: {
    // 					calendar.selectedDate = styleData.date
    // 				}

    // 				onDoubleClicked: {
    // 					root.close();
    // 				}
    // 			}
    // 		}
    // 	}
    // }
	QtObject {
		id: _

		function getDayBorderColor(styleData) {
			if(!styleData) {
				return "transparent";
			}

			if(styleData.today) {
				return ColorStyle.secondaryColor;
			}

			if(styleData.hovered) {
				return ColorStyle.mainHoverColor;
			}

			if(styleData.selected) {
				return ColorStyle.mainColor;
			}

			return "transparent";
		}
	}
}
