import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Widgets
import Components
import Services

PopupWindow {
    id: root

    anchorSide: "right"

    ListView {
        id: mediaPlayers

        Layout.fillWidth: true
        implicitHeight: contentHeight
        spacing: 10

        model: MediaService.allPlayersModel

        delegate: Rectangle {
            width: mediaPlayers.width
            implicitHeight: 120
            color: "Transparent"

            ColumnLayout {
                anchors.fill: parent
                spacing: 5

                RowLayout {
                    Layout.fillWidth: true
                    height: 50
                    spacing: 10
                    
                    // -------------------- Image ------------------------------
                    ClippingRectangle {
                        width: 50
                        height: 50
                        radius: 5
                        color: "grey"
                    
                        Image {
                            anchors.fill: parent
                            source: modelData?.trackArtUrl || "image://icon/" + modelData?.desktopEntry || ""
                            fillMode: Image.PreserveAspectCrop
                        }
                    }

                    // -------------------- Title and Artist ------------------------------
                    ColumnLayout {
                        Layout.fillWidth: true
                        spacing: 0

                        Text {
                            text: modelData.trackTitle
                            color: "white"
                            font.pixelSize: 14
                            elide: Text.ElideRight
                            Layout.fillWidth: true
                        }
                        Text {
                            text: modelData.trackArtist
                            color: "#a0a0a0"
                            font.pixelSize: 12
                        }
                    }
                }

                // -------------------- Progress Bar ------------------------------
                Rectangle {
                    id: track
                    Layout.fillWidth: true
                    height: 10
                    radius: 5
                    color: "grey"

                    Rectangle {
                        id: fill
                        anchors.verticalCenter: parent.verticalCenter
                        height: parent.height
                        radius: height / 2
                        color: "white"
                        width: MediaService.getProgress(modelData) * track.width

                        Behavior on width {
                            NumberAnimation {
                                duration: 400
                                easing.type: Easing.OutQuint
                            }
                        }
                    }

                    MouseArea {
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onPressed: modelData.position = (mouse.x / parent.width) * modelData.length
                    }
                }
                
                // -------------------- Controls ------------------------------
                RowLayout {
                    Layout.fillWidth: true
                    height: 40

                    Item { Layout.fillWidth: true }

                    IconBox {
                        size: 40
                        rectRadius: 0
                        rectColor: "Transparent"
                        imageUrl: Qt.resolvedUrl("../../Assets/Icons/mediaBack.svg")

                        MouseArea {
                            anchors.fill: parent
                            cursorShape: Qt.PointingHandCursor
                            onClicked: modelData.previous()
                        }
                    }
                    IconBox {
                        size: 40
                        rectRadius: 0
                        rectColor: "Transparent"
                        imageUrl: Qt.resolvedUrl("../../Assets/Icons/" + (modelData.isPlaying ? "mediaPause.svg" : "mediaPlay.svg"))

                        MouseArea {
                            anchors.fill: parent
                            cursorShape: Qt.PointingHandCursor
                            onClicked: modelData.togglePlaying()
                        }
                    }
                    IconBox {
                        size: 40
                        rectRadius: 0
                        rectColor: "Transparent"
                        imageUrl: Qt.resolvedUrl("../../Assets/Icons/mediaForward.svg")

                        MouseArea {
                            anchors.fill: parent
                            cursorShape: Qt.PointingHandCursor
                            onClicked: modelData.next()
                        }
                    }

                    Item { Layout.fillWidth: true }
                }

                Separator {
                    visible: index < mediaPlayers.count - 1
                }
            }
        }
    }
}