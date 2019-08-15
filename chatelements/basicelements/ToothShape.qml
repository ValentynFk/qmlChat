import QtQuick 2.8
import QtQuick.Shapes 1.12

Item {
    id: toothShapeItem
    property color itemColor:       "lightgrey"

    property real  leftOffset:  16
    property real  maxHeight:   20

    property bool leftToRight: true
    property bool rightToLeft: false

    Shape {
        anchors.bottom: toothShapeItem.bottom
        width: toothShapeItem.implicitWidth
        height: toothShapeItem.implicitHeight

        visible: leftToRight

        ShapePath {
            fillColor:   toothShapeItem.itemColor

            strokeColor: toothShapeItem.itemColor
            strokeWidth: 0

            startX: -toothShapeItem.leftOffset
            startY: 0
            PathLine { x: -2; y: -toothShapeItem.height }
            PathLine { x: -1; y: -toothShapeItem.maxHeight }
            PathLine { x: 0; y: -toothShapeItem.height/2 }
            PathLine { x: 1; y: -toothShapeItem.height/3 }
            PathLine { x: 2; y: -toothShapeItem.height/3.5 }
            PathLine { x: 3; y: -toothShapeItem.height/4 }
            PathLine { x: toothShapeItem.width; y: 0 }
        }
    }

    Shape {
        anchors.bottom: toothShapeItem.bottom
        width: toothShapeItem.implicitWidth
        height: toothShapeItem.implicitHeight

        visible: rightToLeft

        ShapePath {
            fillColor:   toothShapeItem.itemColor

            strokeColor: toothShapeItem.itemColor
            strokeWidth: 0

            startX: toothShapeItem.leftOffset + toothShapeItem.width
            startY: 0
            PathLine { x: 2 + toothShapeItem.width; y: -toothShapeItem.height }
            PathLine { x: 1 + toothShapeItem.width; y: -toothShapeItem.maxHeight }
            PathLine { x: toothShapeItem.width; y: -toothShapeItem.height/2 }
            PathLine { x: toothShapeItem.width - 1; y: -toothShapeItem.height/3 }
            PathLine { x: toothShapeItem.width - 2; y: -toothShapeItem.height/3.5 }
            PathLine { x: toothShapeItem.width - 3; y: -toothShapeItem.height/4 }
            PathLine { x: 0; y: 0 }
        }
    }
}
