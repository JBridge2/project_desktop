import QtQuick
import Quickshell
import "../../../Services/"

Rectangle {
    id: powerRoot
    width: 40
    height: 40
    color: PopupState.isOpen("power") ? "#4d4d4d" : "Transparent"
    radius: 5

    Image {
        anchors.centerIn: parent
        source: Qt.resolvedUrl("../../../Assets/Icons/power.svg")
        fillMode: Image.PreserveAspectFit
        smooth: true
        width: 26
        height: 26
        sourceSize: Qt.size(26, 26)
    }

    MouseArea {
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        onClicked: PopupState.toggle("power")
    }
}