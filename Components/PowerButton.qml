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
    color: "Transparent"

    RowLayout {
        anchors.fill: parent
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
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        hoverEnabled: true
        onHoveredChanged: root.color = hovered ? "#bbb7b7" : "transparent"
        onClicked: powerProc.run
    }

    Process {
        id: powerProc
        command: powerOption
    }
}