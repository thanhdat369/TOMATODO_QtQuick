import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

import "layout"
import "../components"
import "../style"

Item{
	id: root

	ColumnLayout {
		width: root.width

		spacing: 10

		TopLayout {
			id: topLayout

			Layout.fillWidth: true
			hasSettingButton: false
		}

		ColumnLayout {
			spacing: 10

			Layout.fillWidth: true

			Layout.alignment: Qt.AlignCenter

			RowLayout {
				Label {
					id: label

					Layout.alignment: Qt.AlignLeft

					font.family: "Inter"
					font.bold: true
					font.styleName: "normal"
					text: qsTr("Languague")
				}

				ComboBox {
					id: languageCombobox

					editable: true
					Layout.alignment: Qt.AlignRight

					model: ["English", "Tiếng Việt"]

				}
			}
		}
	}
}
