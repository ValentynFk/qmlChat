import QtQuick 2.8
import QtQuick.Controls 2.5
import QtQuick.Shapes 1.12

Item {
    id: ownMessageItem

    property string text:            "empty"
    property string publicationDate: "no data"
    property color  color:           "steelblue"
    property color  textColor:       "white"
    property color  dateColor:       "steelblue"

    Column {
        anchors.left: parent.left
        spacing: 6

        Row {
            Control {
                id: ownMessageToothShape

                width:  10
                height: 15
                anchors.bottom: ownMessageContainer.bottom

                property color itemColor: "steelblue"

                property real  leftOffset:  16
                property real  maxHeight:   20

                Shape {
                    anchors.bottom: ownMessageToothShape.bottom
                    width: ownMessageToothShape.implicitWidth
                    height: ownMessageToothShape.implicitHeight

                    ShapePath {
                        fillColor:   ownMessageToothShape.itemColor

                        strokeColor: ownMessageToothShape.itemColor
                        strokeWidth: 0

                        startX: ownMessageToothShape.leftOffset + ownMessageToothShape.width
                        startY: 0
                        PathLine { x: 2 + ownMessageToothShape.width; y: -ownMessageToothShape.height }
                        PathLine { x: 1 + ownMessageToothShape.width; y: -ownMessageToothShape.maxHeight }
                        PathLine { x: ownMessageToothShape.width; y: -ownMessageToothShape.height/2 }
                        PathLine { x: ownMessageToothShape.width - 1; y: -ownMessageToothShape.height/3 }
                        PathLine { x: ownMessageToothShape.width - 2; y: -ownMessageToothShape.height/3.5 }
                        PathLine { x: ownMessageToothShape.width - 3; y: -ownMessageToothShape.height/4 }
                        PathLine { x: 0; y: 0 }
                    }
                }
            }

            Rectangle {
                id: ownMessageContainer

                width: Math.min(ownMessageItem.text.implicitWidth + 20,
                                listView.width - 30)
                height: ownMessageItem.text.implicitHeight + 20
                radius: 15

                color: ownMessageItem.color

                Label {
                    text: ownMessageItem.text
                    color: ownMessageItem.textColor
                    anchors.fill: parent
                    anchors.margins: 10
                    wrapMode: Label.Wrap
                }
            }
        }

        Label {
            id: ownMessageTimestamp
            text: ownMessageItem.publicationDate
            color: ownMessageItem.dateColor
            anchors.left: parent.left
        }
    }
}
