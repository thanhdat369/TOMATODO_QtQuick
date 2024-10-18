import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Basic

import "layout"
import "../components"
import "../style"

Rectangle {
	id: root

	color: ColorStyle.backgroundColor

	signal backClicked

	ColumnLayout {
		width: root.width

		spacing: 20

		TopLayout {
			id: topLayout

			Layout.fillWidth: true
			hasAppTitle: true
			hasBackButton: true

			onBackClicked: {
				root.backClicked();
			}
		}

		ColumnLayout {
			spacing: 10

			Layout.fillWidth: true

			Layout.alignment: Qt.AlignCenter

			RowLayout {
				id: languageLayout
				Layout.fillWidth: true
				Layout.alignment: Qt.AlignLeft
				spacing: 40

				Item {
					width: 100
					Label {
						id: languageLabel

						anchors.centerIn: parent
						font.family: FontStyle.ubuntuMonoBold.name
						font.pixelSize: 16
						color: ColorStyle.mainColor

						text: qsTr("Languague")
					}
				}

				DropdownBox {
					id: languageDropdown
					model: [qsTr("English"), qsTr("Vietnamese")]
					height: 100
					width: 250
				}

			}

			RowLayout {
				id: colorLayout
				Layout.fillWidth: true
				Layout.alignment: Qt.AlignLeft
				spacing: 35

				Item {
					width: 100
					Label {
						anchors.centerIn: parent
						font.family: FontStyle.ubuntuMonoBold.name
						font.pixelSize: 16
						color: ColorStyle.mainColor

						text: qsTr("Switch")
					}
				}
				// TODO Separate this Switch
				Switch {
					id: switchTheme
					checked: ColorStyle.isDark

					indicator: Rectangle {
						implicitWidth: 48
						implicitHeight: 26
						x: switchTheme.leftPadding
						y: parent.height / 2 - height / 2
						radius: 13
						color: switchTheme.checked ? ColorStyle.mainColor : ColorStyle.backgroundColor
						border.color: switchTheme.checked ? ColorStyle.backgroundColor : ColorStyle.mainColor

						Rectangle {
							x: switchTheme.checked ? parent.width - width - 4 : 4
							y: parent.height / 2 - height / 2
							width: 22
							height: 22
							radius: 11
							color: ColorStyle.mainColor
							border.color: switchTheme.checked ? ColorStyle.backgroundColor : ColorStyle.mainColor
						}
					}

					onCheckedChanged: {
						ColorStyle.isDark = checked;
					}
				}

			}
		}

	}
}
