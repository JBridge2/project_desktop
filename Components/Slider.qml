import QtQuick
import Quickshell

Rectangle {
    id: root

    property int value: 10
    property int from: 0
    property int to: 100
    property int stepSize: 1

    width: 300
    height: 26
    radius: height / 2
    color: "#6d6d6d"

    Item {
        id: track

        anchors.centerIn: parent
        width: parent.width - 4
        height: parent.height - 4

        Rectangle {
            id: fill
            anchors.verticalCenter: parent.verticalCenter
            width: (value / to) * (track.width - handle.width) + handle.width
            height: parent.height
            radius: height / 2
            color: "white"
            x: 0

            Behavior on width {
                NumberAnimation {
                    duration: 400
                    easing.type: Easing.OutQuint
                }
            }
        }
    
        Rectangle {
            id: handle
            anchors.verticalCenter: parent.verticalCenter
            width: parent.height
            height: parent.height
            radius: height / 2
            color: mouseArea.pressed ? "#b0b0b0" : "white"
            border.width: 1
            border.color: "#dcdde1"
            x: value * (parent.width - width) / to

            Behavior on x {
                NumberAnimation {
                    duration: 400
                    easing.type: Easing.OutQuint
                }
            }
        }
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        onPressed: updateValue(mouse.x)
        onPositionChanged: if (mouse.buttons & Qt.LeftButton) updateValue(mouse.x)

        function updateValue(mouseX) {
            var newValue = Math.round((mouseX - handle.width / 2) / (parent.width - handle.width) * (to - from) + from)
            value = Math.max(from, Math.min(to, newValue))
            console.log(handle.x)
        }
    }
}