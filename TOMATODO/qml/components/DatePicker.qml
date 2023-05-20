import QtQuick 2.15
import QtQuick.Layouts 1.15

Item {
	id: root

	property color color: "white"

	height: 20
	width: 260

	RowLayout {
		anchors.horizontalCenter: root.horizontalCenter
		spacing: 5

		Rectangle {
			id: backIconBox

			Layout.preferredHeight: root.height
			Layout.preferredWidth: 30

			color: "transparent"

			IconButton {
				id: iconBackButton
				color: root.color

				iconSrc: "qrc:assets/icon/arrow-back.svg"
			}
		}

		Rectangle {
			color: "transparent"

			Layout.preferredWidth: 100
			Layout.preferredHeight: root.height
			Text {
				id: dateTimeText

				anchors.centerIn: parent
				color: root.color

				text: qsTr("10 January 2023")

			}
		}

		Rectangle{
			id: fowardIconBox

			Layout.preferredHeight: root.height
			Layout.preferredWidth: 30

			color: "transparent"

			IconButton {
				id: iconFowardButton

				color: root.color

				iconSrc: "qrc:assets/icon/arrow-foward.svg"
			}
		}
	}

}
