import QtQuick
import QtQuick.Layouts 1.15
import Quickshell
import Components
import Core
import Services

PopupWindow {
    id: root

    anchorSide: "right"
    implicitWidth: 360
    implicitHeight: main.implicitHeight + 40

    Rectangle {
        anchors.fill: parent
        radius: 10
        color: "#333333"

        GridLayout {
            id: main
            anchors.fill: parent
            anchors.margins: 20
            columns: 2
            rowSpacing: 10
            columnSpacing: 20

            ImageBox {
                Layout.columnSpan: 2
                height: 140
                line1: "Welcome"
                line2: "Joshua"
            }

            ImageBox {
                Layout.columnSpan: 1
                line1: "Wi-Fi"
                line2: NetworkService.wifiConnected ? NetworkService.ssid : "Disconnected"
                popup: "network"
                WifiIcon {}
            }

            ImageBox {
                Layout.columnSpan: 1
                image: connected ? "vpn_connected.svg" : "vpn_disconnected.svg"
                line1: "VPN"
                line2: "Disconnected"
            }

            ImageBox {
                Layout.columnSpan: 1
                popup: "bluetooth"
                image: "bluetooth.svg"
                connected: BluetoothService?.adapter?.enabled ?? false
                line1: "Bluetooth"
                line2: BluetoothService?.adapter?.enabled ? "On" : "Off"
            }
            
            ImageBox {
                Layout.columnSpan: 1
                line1: "Focus"
                line2: "Focus Mode"
            }

            WidgetBox {
                id: brightnessBox
                Layout.columnSpan: 2
                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 10
                    spacing: 5

                    Text {
                        text: "Brightness"
                        color: "white"
                        font.pixelSize: 14
                        font.bold: true
                    }
                    Slider {

                    }
                }
            }

            WidgetBox {
                id: volumeBox
                Layout.columnSpan: 2
                popup: "audio"

                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 10
                    spacing: 5

                    Text {
                        text: "Volume"
                        color: "white"
                        font.pixelSize: 14
                        font.bold: true
                    }
                    Slider {
                        value: AudioService.defaultSink && !AudioService.defaultSink.audio.muted? (AudioService.defaultSink.audio.volume * 100) : 0
                        onMoved: (val) => {
                            AudioService.setVolume(AudioService.defaultSink, val);
                        }
                    }
                }
                
            }

            ImageBox {
                Layout.columnSpan: 2
                line1: "Music"
                line2: "Artist"
            }
        }
    }


    //---------- Components ----------
    component WidgetBox: Rectangle {
        property string popup: ""

        Layout.fillWidth: true
        height: 70
        radius: 10
        color: "#3c3c3c"
        border.width: 1
        border.color: "#4d4d4d"

        MouseArea {
            id: mouseArea
            anchors.fill: parent
            onClicked: PopupState.toggle(popup)
        }
    }

    component ImageBox: WidgetBox {
        id: widgetBox
        property url image: ""
        property bool connected: false
        property string line1: ""
        property string line2: ""

        default property alias icon: iconPlaceholder.data

        width: 150

        RowLayout {
            anchors.fill: parent
            anchors.margins: 10
            spacing: 10

            Item {
                id: iconPlaceholder
                Layout.preferredWidth: 40
                Layout.preferredHeight: 40

                IconBox {
                    visible: iconPlaceholder.children.length <= 1
                    size: 40
                    imageUrl: widgetBox.image
                    connected: widgetBox.connected
                }
            }

            ColumnLayout {
                spacing: -2
                Layout.alignment: Qt.AlignLeft
                Layout.margins: 0

                Text {
                    text: line1
                    color: "white"
                    font.pixelSize: 14
                    font.bold: true
                    
                }
                Text {
                    text: line2
                    color: "white"
                    font.pixelSize: 12
                }
            }

            Item {
                Layout.fillWidth: true
            }
        }
    }
}