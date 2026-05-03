import QtQuick
import Quickshell
import "../../../Services/"

Rectangle {
    id: root

    property int size: 40
    width: size
    height: size
    radius: 5
    color: PopupState.isOpen("controlCenter") ? "#4d4d4d" : "Transparent"

    Image {
        anchors.centerIn: parent
        source: Qt.resolvedUrl("../../../Assets/Icons/control_center_icon.svg")
        sourceSize: Qt.size(size * 0.7, size * 0.7)
        width: size * 0.7
        height: size * 0.7
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        onClicked: PopupState.toggle("controlCenter")
    }
}