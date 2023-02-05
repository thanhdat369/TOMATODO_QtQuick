import QtQuick 2.15

Item {
    id: root

    property color color: "black"
    property string text: "TOMATODO"

    Rectangle{
        width:344
        height: 36
        color: "transparent"

        Text {
            id: headTitle
            anchors.horizontalCenter : parent.horizontalCenter

            color: root.color

            font.family: "Inter"
            font.bold: true
            font.pixelSize: 30
            font.styleName: "normal"
            lineHeight: 30

            text: qsTr(root.text)
        }
    }
}
