import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick 2.8
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQml.Models 2.12
import "basicelements" as BasicElements

Item {
    ListView {
        id: listView

        anchors.fill: parent

        anchors.margins: 0
        spacing: 1
        clip: true

        highlightFollowsCurrentItem: true

        model: messagesModel
    }

    DelegateModel {
        id: messagesModel

        model: ListModel {
            //@disable-check M16
            ListElement { owns: false; author: "Someone"; message: "hello:)"; timestamp: "7 Jan 14:36" }
            //@disable-check M16
            ListElement { owns: true; author: "Volodya"; message: "hi to you"; timestamp: "7 Jan 14:36" }
            //@disable-check M16
            ListElement { owns: true; author: "Bob"; message: "abcd"; timestamp: "7 Jan 14:36" }
            //@disable-check M16
            ListElement { owns: false; author: "Someone"; message: "hello again, \n\nI said:)"; timestamp: "7 Jan 14:36" }
            //@disable-check M16
            ListElement { owns: true; author: "Eva"; message: "very long message very long message, very long message again and very long message"; timestamp: "7 Jan 14:36" }
            //@disable-check M16
            ListElement { owns: false; author: "Max"; message: "other message"; timestamp: "7 Jan 14:36" }
            //@disable-check M16
            ListElement { owns: true; author: "Someone"; message: "last one"; timestamp: "7 Jan 14:36" }
        }

        delegate: Column {
            id: messageAttributesColumn

            readonly property bool adjustRight: model.owns
            anchors.right: messageAttributesColumn.adjustRight ?
                               parent.right : undefined
            anchors.left:  messageAttributesColumn.adjustRight ?
                               undefined    : parent.left

            spacing: 3

            Row {
                id: messageAttributesRow

                anchors.right: messageAttributesColumn.adjustRight ?
                                   parent.right : undefined
                anchors.left:  messageAttributesColumn.adjustRight ?
                                   undefined    : parent.left

                spacing: 0

                Control {
                    id: leftToothShape

                    anchors.bottom: messageBody.bottom
                    width:  messageAttributesColumn.adjustRight ? 0 : 10
                    height: messageAttributesColumn.adjustRight ? 0 : 15
                    property string qml: messageAttributesColumn.adjustRight ?
                                             "" : "basicelements/ToothShapeToLeft.qml"

                    Loader {
                        anchors.fill: parent
                        Component.onCompleted: {
                            setSource(leftToothShape.qml,
                                      {
                                          itemColor: "steelblue",
                                          leftOffset: 16,
                                          maxHeight: 20
                                      })
                        }
                    }
                }

                Rectangle {
                    id: messageBody

                    width: Math.min(messageText.implicitWidth + 24,
                                    listView.width - 70)

                    height: messageText.implicitHeight + 24
                    color: "steelblue"

                    border.width: 0
                    radius: 15

                    Label {
                        id: messageText

                        anchors.fill: parent
                        anchors.margins: 12
                        wrapMode: Label.Wrap

                        text: model.message
                        color: "white"
                    }
                }

                Control {
                    id: rightToothShape

                    anchors.bottom: messageBody.bottom
                    width:  messageAttributesColumn.adjustRight ? 10 : 0
                    height: messageAttributesColumn.adjustRight ? 15 : 0
                    property string qml: messageAttributesColumn.adjustRight ?
                                             "basicelements/ToothShapeToRight.qml" : ""

                    Loader {
                        anchors.fill: parent
                        Component.onCompleted: {
                            setSource(rightToothShape.qml,
                                      {
                                          itemColor: "steelblue",
                                          leftOffset: 16,
                                          maxHeight: 20
                                      })
                        }
                    }
                }
            }

            Label {
                id: timestampText

                anchors.right: messageAttributesColumn.adjustRight ?
                                   parent.right : undefined
                anchors.left:  messageAttributesColumn.adjustRight ?
                                   undefined    : parent.left

                text: model.timestamp
                color: "steelblue"
            }
        }
    }
}

