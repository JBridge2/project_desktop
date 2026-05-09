import QtQuick
import QtQuick.Layouts 1.15
import Quickshell
import Quickshell.Io

Rectangle {
    id: root

    property string name: "Power"
    property url icon: ""
    property var powerOption: null

    Layout.fillWidth: true
    Layout.preferredHeight: 40
    radius: 10
    color: mouseArea.containsMouse ? "#555555" : "Transparent"

    RowLayout {
        anchors.fill: parent
        anchors.leftMargin: 10
        spacing: 10

        Image {
            source: Qt.resolvedUrl(icon)
            width: 20
            height: 20
        }

        Text {
            text: name
            color: "white"
            font.pixelSize: 16
        }

        Item {
            Layout.fillWidth: true
        }

    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        onClicked: powerProc.running = true
        hoverEnabled: true
    }

    Process {
        id: powerProc
        command: powerOption
    }
}