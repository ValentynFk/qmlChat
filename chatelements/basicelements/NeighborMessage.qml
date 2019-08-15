import QtQuick 2.8
import QtQuick.Controls 2.5
import QtQuick.Shapes 1.12

Item {
    id: neighborMessageItem

    property string text:            "empty"
    property string publicationDate: "no data"
    property color  color:           "steelblue"
    property color  textColor:       "white"
    property color  dateColor:       "steelblue"

    Column {
        anchors.right: parent.right
        spacing: 6

        width: neighborMessageContainer.implicitHeight
        height: neighborMessageContainer.implicitHeight

        Row {
            Rectangle {
                id: neighborMessageContainer

                width: Math.min(neighborMessageItem.text.implicitWidth + 20,
                                listView.width - 30)
                height: neighborMessageItem.text.implicitHeight + 20
                radius: 15

                color: neighborMessageItem.color

                Label {
                    text: neighborMessageItem.text
                    color: neighborMessageItem.textColor
                    anchors.fill: parent
                    anchors.margins: 10
                    wrapMode: Label.Wrap
                }
            }

            Control {
                id: neighborMessageToothShape

                width:  10
                height: 15
                anchors.bottom: neighborMessageContainer.bottom

                property color itemColor: "steelblue"

                property real  leftOffset:  16
                property real  maxHeight:   20

                Shape {
                    anchors.bottom: neighborMessageToothShape.bottom
                    width: neighborMessageToothShape.implicitWidth
                    height: neighborMessageToothShape.implicitHeight

                    ShapePath {
                        fillColor:   neighborMessageToothShape.itemColor

                        strokeColor: neighborMessageToothShape.itemColor
                        strokeWidth: 0

                        startX: -neighborMessageToothShape.leftOffset
                        startY: 0
                        PathLine { x: -2; y: -neighborMessageToothShape.height }
                        PathLine { x: -1; y: -neighborMessageToothShape.maxHeight }
                        PathLine { x: 0; y: -neighborMessageToothShape.height/2 }
                        PathLine { x: 1; y: -neighborMessageToothShape.height/3 }
                        PathLine { x: 2; y: -neighborMessageToothShape.height/3.5 }
                        PathLine { x: 3; y: -neighborMessageToothShape.height/4 }
                        PathLine { x: neighborMessageToothShape.width; y: 0 }
                    }
                }
            }
        }

        Label {
            id: neighborMessageTimestamp
            text: neighborMessageItem.publicationDate
            color: neighborMessageItem.dateColor
            anchors.right: parent.right
        }
    }
}
