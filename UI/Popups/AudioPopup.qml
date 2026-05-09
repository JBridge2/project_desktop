import QtQuick
import QtQuick.Layouts
import Quickshell
import Components
import Core
import Services

PopupWindow {
    id: root

    anchorSide: "right"
    implicitWidth: 360
    implicitHeight: main.implicitHeight + 30

    Rectangle {
        anchors.fill: parent
        radius: 10
        color: "#3c3c3c"

        ColumnLayout {
            id: main

            anchors.fill: parent
            anchors.margins: 15
            spacing: 10

            Text {
                text: "Volume"
                color: "white"
                font.pixelSize: 16
                font.bold: true
            }

            Slider {
                value: AudioService.defaultSink && !AudioService.defaultSink.audio.muted? (AudioService.defaultSink.audio.volume * 100) : 0
                onMoved: (val) => {
                    AudioService.setVolume(AudioService.defaultSink, val);
                }
            }

            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 1
                Layout.topMargin: 5
                color: "#7d7d7d"
            }

            Text {
                text: "Output"
                color: "white"
                font.pixelSize: 14
                font.bold: true
            }

            ListView {
                id: outputs
                model: AudioService.sinksModel

                Layout.fillWidth: true
                implicitHeight: contentHeight

                delegate: Delegate {
                    name: modelData.description
                }
            }
        }
    }
}