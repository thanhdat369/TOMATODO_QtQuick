import QtQuick 2.15
import QtQuick.Layouts 1.15
import "layout"
import "../components"
Item{
	id: root

	ColumnLayout {
		width: root.width

		spacing: 10

		TopLayout {
			id: topLayout

			Layout.fillWidth: true

			hasBackButton: false
		}

		DatePicker {
			id: datePicker
			Layout.alignment: Qt.AlignCenter
		}
		// this date picker is work arround fix in later

		ColumnLayout {
			spacing: 10
			Layout.fillWidth: true
			Layout.alignment: Qt.AlignCenter
			IconButton {
				Layout.alignment: Qt.AlignRight
			}

			TaskCard {
			}
			TaskCard {
			}
			TaskCard {
			}
			TaskCard {
			}
			TaskCard {
			}
			TaskCard {
			}
			TaskCard {
			}
			TaskCard {
			}
		}
	}
}
