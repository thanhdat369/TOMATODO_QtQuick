import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../components"

// Please do not remove it, this component for debug and testing only
ScrollView {
	id: scrollView
	anchors.fill: parent

	Layout.alignment: Qt.AlignCenter

	ColumnLayout {
	width: Math.max(implicitWidth, scrollview.availableWidth)
	Repeater {
		model:100
		delegate: TaskCard {}
	}
	}
}
