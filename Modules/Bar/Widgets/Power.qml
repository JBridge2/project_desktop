import QtQuick
import Quickshell

Rectangle {
    id: powerRoot
    width: 28
    height: 28
    color: "#4c566a"
    radius: 14

    Image {
        anchors.centerIn: parent
        source: Qt.resolvedUrl("../../../Assets/Icons/power.svg")
        fillMode: Image.PreserveAspectFit
        smooth: true
        width: 18
        height: 18
        sourceSize: Qt.size(18, 18)
    }

    MouseArea {
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        onClicked: powerPopup.visible = !powerPopup.visible
    }

    PowerPopup {
        id: powerPopup
        visible: false
    }
}