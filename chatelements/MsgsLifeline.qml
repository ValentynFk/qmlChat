import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick 2.8
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQml.Models 2.12
import "basicelements" as BasicElements

Item {
    /*
    Rectangle {
        width: parent.width
        height: parent.height
        color: "silver"
    }
    */
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
            anchors.right: model.owns ? parent.right : undefined
            spacing: 6

            Row {
                id: messageRow
                spacing: 0
                anchors.right: model.owns ? parent.right : undefined

                Control {
                    width: 10
                    height: 15
                    anchors.bottom: messageBody.bottom

                    visible: !model.owns

                    BasicElements.ToothShape {
                        anchors.fill: parent
                        itemColor: "steelblue"
                        leftOffset: 16
                        maxHeight: 20
                        leftToRight: false
                        rightToLeft: true
                    }
                }

                Rectangle {
                    id: messageBody

                    width: Math.min(messageText.implicitWidth + 24,
                                    listView.width - 30)

                    height: messageText.implicitHeight + 24
                    color: model.owns ? "steelblue" : "steelblue"

                    border.width: 0
                    radius: 15

                    Label {
                        id: messageText
                        text: model.message
                        color: model.owns ? "black" : "black"
                        anchors.fill: parent
                        anchors.margins: 12
                        wrapMode: Label.Wrap
                    }
                }

                Control {
                    width: 10
                    height: 15
                    visible: model.owns
                    anchors.bottom: messageBody.bottom

                    BasicElements.ToothShape {
                        anchors.fill: parent
                        itemColor: "steelblue"
                        leftOffset: 16
                        maxHeight: 20
                        leftToRight: true
                        rightToLeft: false
                    }
                }
            }
            Label {
                id: timestampText
                text: model.timestamp//Qt.formatDateTime(model.timestamp, "d MMM hh:mm")
                color: "lightgrey"
                anchors.right: model.owns ? parent.right : undefined
            }
        }
    }
        /*
        Control {
            width : listView.width
            height: listView.height / 10
            //width: messageLoader.implicitWidth
            //height: messageLoader.implicitHeight


            Rectangle {
                anchors.fill: parent
                color: "green"
            }

            Loader {
                id: messageLoader
                onLoaded: console.log(messageLoader.item.implicitHeight);
            }

            Component.onCompleted: {
                messageLoader.setSource(model.owns? "basicelements/OwnMessage.qml" : "basicelements/NeighborMessage.qml",
                                     { "text": model.message,
                                       "publicationDate": model.timestamp,
                                       "color": "steelblue",
                                       "textColor": "white",
                                       "dateColor": "steelblue",
                                       "width": parent.width,
                                       "height": parent.height / 3});
                // will trigger the onLoaded code when complete.
            }
        }
        */
}

