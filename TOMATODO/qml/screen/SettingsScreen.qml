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

		spacing: 20

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
				id: languageLayout
				Layout.fillWidth: true
				Layout.alignment: Qt.AlignLeft
				spacing: 20

				Label {
					id: languageLabel

					font.family: FontStyle.ubuntuMonoBold.name
					font.pixelSize: 16
					color: ColorStyle.mainColor

					text: qsTr("Languague")
				}

				DropdownBox {
					id: languageDropdown
					model: ["English","Vietnamese"]
					height: 100
					width: 250
				}

			}
		}
	}
}
