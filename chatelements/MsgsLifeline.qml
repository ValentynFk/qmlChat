import QtQuick          2.8
import QtQml.Models     2.12
import QtQuick.Layouts  1.3
import QtQuick.Controls 2.5
import "basicelements"       as BasicElements
import "scripts/ChatBase.js" as ChatBase

Item
{
    id: messagesHistory

    Rectangle
    {
        anchors.fill: parent
        color: ChatBase.backgroundColor(globalTheme)
    }
    ListView
    {
        id: listView

        anchors.fill: parent
        anchors.margins: 0
        spacing:         5

        clip:                        true
        highlightMoveDuration:       300
        highlightFollowsCurrentItem: true
        boundsBehavior:              Flickable.StopAtBounds

        onCountChanged:
        {
            Qt.callLater( listView.positionViewAtEnd )
        }
        onHeightChanged:
        {
            listView.positionViewAtEnd()
        }

        model: messagesModel

        ScrollBar.vertical: ScrollBar {}
    }
    DelegateModel
    {
        id: messagesModel

        model: ListModel
        {
            //@disable-check M16
            ListElement { authorName: "Vasia nickname and something"; type: "ordinary"; content: "hello" }
            //@disable-check M16
            ListElement { authorName: "PairStorm"; type: "service"; content: "hello from Pair storm application" }
            //@disable-check M16
            ListElement { authorName: "PairStorm"; type: "service"; content: "you cannot log in twice" }
            //@disable-check M16
            ListElement { authorName: "Diana nickname"; type: "ordinary"; content: "pruvit" }
            //@disable-check M16
            ListElement { authorName: "ValntynFk"; type: "ordinary"; content: "hello" }
            //@disable-check M16
            ListElement { authorName: "ValentynFk"; type: "ordinary"; content: "flkj dsalkfjdsalkfj dslk jflksda ffdsalhflkds halkfhdsalkh flhdsa klflkdsa;hf ksadhlkf; dshakfl;hdsalk ;flkdsa flk hsalkf hsdalk hf;lkdsahfdsa ;" }
            //@disable-check M16
            ListElement { authorName: "Peter"; type: "ordinary"; content: "hello" }
        }

        delegate: Column
        {
            id: messageAttributesColumn

            readonly property bool adjustRight: model.authorName === globalUserName

            anchors.left:  messageAttributesColumn.adjustRight ?
                               undefined    : parent.left
            anchors.right: messageAttributesColumn.adjustRight ?
                               parent.right : undefined

            anchors.rightMargin: 7
            anchors.leftMargin:  7

            Row
            {
                id: messageAttributesRow

                anchors.left:  messageAttributesColumn.adjustRight ?
                                   undefined    : parent.left
                anchors.right: messageAttributesColumn.adjustRight ?
                                   parent.right : undefined

                Control
                {
                    id: leftToothShape
                    z: 1

                    anchors.bottom: messageBody.bottom
                    width:  messageAttributesColumn.adjustRight ? 0 : 10
                    height: messageAttributesColumn.adjustRight ? 0 : 15

                    enabled: !messageAttributesColumn.adjustRight
                    visible: !messageAttributesColumn.adjustRight

                    BasicElements.ToothShapeToLeft
                    {
                        anchors.fill: parent

                        itemColor:  messageBody.color
                        maxHeight:  messageBody.height
                        rightOffset: 16
                    }
                }

                Rectangle
                {
                    id: messageBody
                    z: 2


                    width:
                    {
                        return Math.min(Math.max(messageText.implicitWidth,
                                                 messageAuthor.contentWidth) + 24,
                                        messagesHistory.width - 70)
                    }
                    height: messageText.implicitHeight + 27
                    radius: 10

                    color:
                    {
                        if (model.type === "ordinary")
                        {
                            return messageAttributesColumn.adjustRight          ?
                                   ChatBase.chatAuthorMessageColor(globalTheme) :
                                   ChatBase.chatUserMessageColor(globalTheme)
                        }
                        if (model.type === "service")
                        {
                            return ChatBase.chatSystemMessageColor(globalTheme)
                        }
                    }

                    TextEdit
                    {
                        id: messageText

                        anchors.fill: parent
                        anchors.margins:   10
                        anchors.topMargin: 23

                        selectByMouse: true
                        readOnly:      true
                        wrapMode:      TextEdit.Wrap

                        text: qsTr(model.content + "\n")

                        color:             ChatBase.chatMessageTextColor(globalTheme)
                        selectionColor:    Qt.darker(messageBody.color, 1.3)
                        selectedTextColor: color


                        MouseArea
                        {
                            anchors.fill: parent

                            enabled:     false
                            cursorShape: Qt.IBeamCursor
                        }
                    }
                    RowLayout
                    {
                        anchors.fill: parent
                        anchors.left: messageAttributesColumn.adjustRight ?
                                           undefined : messageBody.left
                        anchors.right: messageAttributesColumn.adjustRight ?
                                           messageBody.right : undefined
                        anchors.leftMargin:  10
                        anchors.rightMargin: 15

                        Label
                        {
                            id: messageAuthor

                            Layout.alignment: messageAttributesColumn.adjustRight ?
                                                  Qt.AlignRight : Qt.AlignLeft
                            Layout.fillHeight: true
                            Layout.topMargin: 4

                            Layout.preferredWidth:
                            {
                                return Math.min(messageBody.width - 10,
                                                messageAuthor.implicitWidth)
                            }
                            text:  qsTr("  " + model.authorName)
                            clip:  true
                            elide: Text.ElideRight
                            color: ChatBase.chatMessageTextColor(globalTheme)

                            font.pixelSize: 15
                            font.family:    "Consolas"
                            font.bold:      true

                            Image
                            {
                                width:  13
                                height: 13

                                mipmap:   true
                                fillMode: Image.PreserveAspectFit

                                source:
                                {
                                    if (model.type === "ordinary")
                                    {
                                        return "res/USER.svg"
                                    }
                                    if (model.type === "service")
                                    {
                                        return "res/SYSTEM.svg"
                                    }
                                }
                                sourceSize: Qt.size(width, height)
                            }
                        }
                    }
                    Label
                    {
                        id: timestampText

                        //anchors.right: messageBody.right
                        //wrapMode: Label.Wrap
                        /*

                        anchors.left:  messageAttributesColumn.adjustRight ?
                                           undefined    : parent.left
                        anchors.right: messageAttributesColumn.adjustRight ?
                                           parent.right : undefined
                        */
                        anchors.right: parent.right
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 2
                        //anchors.leftMargin:  5
                        anchors.rightMargin: 8


                        text:  Qt.formatDateTime(model.publicationDateTime, "h:mm AP")
                        color:
                        {
                            if (model.type === "ordinary")
                            {
                                return messageAttributesColumn.adjustRight          ?
                                       ChatBase.chatAuthorMessageDateColor(globalTheme) :
                                       ChatBase.chatUserMessageDateColor(globalTheme)
                            }
                            if (model.type === "service")
                            {
                                return ChatBase.chatSystemMessageDateColor(globalTheme)
                            }
                        }

                        font.pixelSize: 12
                        font.family:    "Hack"
                        font.bold:      true
                    }
                }
                Control
                {
                    id: rightToothShape
                    z: 1

                    anchors.bottom: messageBody.bottom
                    width:  messageAttributesColumn.adjustRight ? 10 : 0
                    height: messageAttributesColumn.adjustRight ? 15 : 0

                    enabled: messageAttributesColumn.adjustRight
                    visible: messageAttributesColumn.adjustRight

                    BasicElements.ToothShapeToRight
                    {
                        anchors.fill: parent

                        itemColor:  messageBody.color
                        maxHeight:  messageBody.height
                        leftOffset: 16
                    }
                }
            }
        }
    }
}

