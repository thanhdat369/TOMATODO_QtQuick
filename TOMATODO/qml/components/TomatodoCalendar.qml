import QtQuick 2.15
import QtQuick.Controls 1.4
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
			color: "blue"
		}

		gridVisible: false
		navigationBar: Rectangle {
			width: calendar.width
			height: 30
			color: ColorStyle.mainColor
			Label {
				text: styleData.title
				color: "white"
			}
		}

		dayDelegate: Rectangle {
			color: ColorStyle.mainColor
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
				color: styleData.valid ? "white" : "grey"
			}

			Rectangle {
				width: parent.width
				height: 1
				color: "#555"
				anchors.bottom: parent.bottom
			}

			Rectangle {
				width: 1
				height: parent.height
				color: "#555"
				anchors.right: parent.right
			}
		}
	}
}
