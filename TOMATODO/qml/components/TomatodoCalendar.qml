import QtQuick 2.15
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.15
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls 2.15
import '../style'

Calendar {
	id: calendar
	implicitHeight: 300
	implicitWidth:  400
	anchors.centerIn: parent
	style: CalendarStyle {
		background: Rectangle {
			width: calendar.width
			color: ColorStyle.backgroundColor
		}

		gridVisible: false

		navigationBar: Rectangle {
			width: calendar.width
			height: 30
			color: ColorStyle.backgroundColor
			RowLayout {
				anchors.centerIn: parent

				IconButton {
					id: backMonthButton

					iconSrc: "qrc:/assets/icon/arrow-back.svg"
					color: ColorStyle.lightColor
					hoverColor: ColorStyle.mainColor

					onClicked: {
						calendar.showPreviousMonth();
					}
				}
				Label {
					Layout.leftMargin: 10
					Layout.rightMargin: 10
					text: styleData.title
					color: ColorStyle.lightColor
				}

				IconButton {
					id: nextMonthButton

					iconSrc: "qrc:/assets/icon/arrow-foward.svg"
					color: ColorStyle.lightColor
					hoverColor: ColorStyle.mainColor
					onClicked: {
						calendar.showNextMonth();
					}
				}
			}
		}

		dayOfWeekDelegate: Rectangle {
			height: 30
			color: ColorStyle.backgroundColor
			Label {
				anchors.centerIn: parent
				text:  control.locale.dayName(styleData.dayOfWeek, control.dayOfWeekFormat)
				color: ColorStyle.lightColor
			}
		}

		dayDelegate: Rectangle {
			color: ColorStyle.backgroundColor
			visible: styleData.visibleMonth
			//			gradient: Gradient {
			//				GradientStop {
			//					position: 0.00
			//					color: styleData.selected ? "#111" : (styleData.visibleMonth && styleData.valid ? "#444" : "#666");
			//				}
			//				GradientStop {
			//					position: 1.00
			//					color: styleData.selected ? "#444" : (styleData.visibleMonth && styleData.valid ? "#111" : "#666");
			//				}
			//				GradientStop {
			//					position: 1.00
			//					color: styleData.selected ? "#777" : (styleData.visibleMonth && styleData.valid ? "#111" : "#666");
			//				}
			//			}

			Label {
				text: styleData.date.getDate()
				anchors.centerIn: parent
				color: ColorStyle.lightColor
			}

			//			Rectangle {
			//				width: parent.width
			//				height: 1
			//				color: "white"
			//				anchors.bottom: parent.bottom
			//			}

			//			Rectangle {
			//				width: 1
			//				height: parent.height
			//				color: "#555"
			//				anchors.right: parent.right
			//			}
		}
	}
}
