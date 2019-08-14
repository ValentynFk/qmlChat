import QtQuick 2.8
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQml.Models 2.12
import QtGraphicalEffects 1.12
import QtQuick.Templates 2.1 as T


Item {
    id: usersList

    Rectangle {
        anchors.fill: parent

        antialiasing: true
        color: "silver"

        /*Rectangle {
            //anchors.fill: parent
            anchors.centerIn: parent
            width: parent.height
            height: parent.width
            anchors.margins: 1

            antialiasing: true

            rotation: 90
            gradient: Gradient {
                GradientStop { position: 0.0; color: "#97d9e1" }
                GradientStop { position: 1.0; color: "#d9afd9" }
            }

        }*/
        //gradient: Gradient.ShadyWater

        T.Switch {
            id: control

            implicitWidth: indicator.implicitWidth
            implicitHeight: background.implicitHeight

            background: Rectangle {
                implicitWidth: 140
                implicitHeight: 20 * 3.8//Theme.baseSize * 3.8
                color: "lightgrey"//Theme.lightGray
                border.color: Theme.gray
            }

            leftPadding: 4

            indicator: Rectangle {
                id: switchHandle
                implicitWidth: 20 * 4.8//Theme.baseSize * 4.8
                implicitHeight: 20 * 2.6//Theme.baseSize * 2.6
                x: control.leftPadding
                anchors.verticalCenter: parent.verticalCenter
                radius: 20 * 1.3//Theme.baseSize * 1.3
                color: "blue"//Theme.light
                border.color: "lightgrey"//Theme.lightGray

                Rectangle {
                    id: rectangle

                    width: 20 * 2.6//Theme.baseSize * 2.6
                    height: 20 * 2.6//Theme.baseSize * 2.6
                    radius: 20 * 1.3//Theme.baseSize * 1.3
                    color: "blue"//Theme.light
                    border.color: "gray"//Theme.gray
                }

                states: [
                    State {
                        name: "off"
                        when: !control.checked && !control.down
                    },
                    State {
                        name: "on"
                        when: control.checked && !control.down

                        PropertyChanges {
                            target: switchHandle
                            color: "green"//Theme.mainColor
                            border.color: "green"//Theme.mainColor
                        }

                        PropertyChanges {
                            target: rectangle
                            x: parent.width - width

                        }
                    },
                    State {
                        name: "off_down"
                        when: !control.checked && control.down

                        PropertyChanges {
                            target: rectangle
                            color: "blue"//Theme.light
                        }

                    },
                    State {
                        name: "on_down"
                        extend: "off_down"
                        when: control.checked && control.down

                        PropertyChanges {
                            target: rectangle
                            x: parent.width - width
                            color: "blue"//Theme.light
                        }

                        PropertyChanges {
                            target: switchHandle
                            color: "red"//Theme.mainColorDarker
                            border.color: "red"//Theme.mainColorDarker
                        }
                    }
                ]
            }
        }
        /*

        ListView {
            anchors.fill: parent
            anchors.margins: 1
            spacing: 1
            clip: true

            highlightFollowsCurrentItem: true
            //snapMode: ListView.SnapOneItem

            model: visualModel
        }
        */
    }



    DelegateModel {
        id: visualModel

        model: ListModel {
            ListElement { name: "Vasia";  online: true; connected: true; }
            ListElement { name: "Diana";  online: true; connected: true; }
            ListElement { name: "Petia";  online: true; connected: false; }
            ListElement { name: "Bohdan"; online: true; connected: false; }
            ListElement { name: "Roma";   online: false; connected: false; }
        }

        delegate: Component {
            Rectangle {

                width:  parent.width
                height: usersList.height/5

                gradient: Gradient.ShadyWater
/*
                LinearGradient {
                    visible: true
                    anchors.fill: parent
                    start: Qt.point(0, 0)
                    end: Qt.point(0, parent.height)
                    gradient: Gradient {
                        GradientStop { position: 0.0; color: "#d9afd9" }
                        GradientStop { position: 1.0; color: "#97d9e1" }
                    }
                }
*/


                RowLayout {
                    anchors.fill: parent
                    Label {
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                        text: qsTr(name)
                        font.pixelSize: 22
                    }

                    Control {
                        Layout.alignment: Qt.AlignRight
                        Layout.margins: 5
                        Layout.rightMargin: 20

                        Layout.minimumWidth: 40
                        Layout.preferredWidth: parent.width * 0.2
                        Layout.maximumWidth: 30
                        Layout.fillHeight: true

                        Switch {
                            id: swch
                            anchors.fill: parent

                            contentItem {
                                height: parent.height
                            }
                            indicator {
                                height: parent.height
                            }

                            layer.smooth: true
                            ToolButton {
                                height: parent.height
                            }

                            checked: online
                        }
                        MouseArea {
                            id: switchArea
                            anchors.fill: swch
                        }
                    }
                }
            }
        }

/*
        delegate: Text {
            text: qsTr(name + (online? " is online" : " is not online"))
        }
*/
        /*
        //model: 10
        delegate: RowLayout {
            //width: parent.implicitWidth
            //height: parent.implicitHeight
            anchors.fill: parent
            spacing: 6

            Rectangle {
                Layout.alignment: Qt.AlignLeft
                Layout.fillWidth:      true
                Layout.minimumWidth:   50
                Layout.preferredWidth: 200
                Layout.maximumWidth:   300
                color: "#aaaaaa"
                Label {
                    anchors.fill: parent
                    text: "hello"
                }
            }
            Rectangle {
                Layout.alignment: Qt.AlignRight
                Layout.maximumHeight: 30
                Layout.minimumHeight: 20
                Layout.preferredHeight: 25
                Image {
                    anchors.fill: parent
                    source: "img/CONNECTED.png"
                    sourceSize.height: 100
                    sourceSize.width:  100
                }
            }
        }
        */

}

/*
    ListView {
        opacity: 1
        implicitWidth: parent.width
        implicitHeight: 600
        clip: true

        model: 10
        delegate: Control {
            width: parent.width
            height: parent.height / 10
            bottomInset: 5
            topInset: 5
            bottomPadding: 10
            topPadding: 10


            hoverEnabled: true
            background: Rectangle {
                      opacity: 0.3
                      color: "#d0d0d0"
                  }
            contentItem: Button {
            width: parent.availableWidth

                id: userIcon
                icon.name: "conn-icon"
                icon.source: "img/CONNECTED.png"
                icon.color: "transparent"
                icon.height: 30
                display: AbstractButton.TextBesideIcon
                spacing: 40

                text: qsTr("name")
            }
        }
    }
    */
}

/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
 ##^##*/
