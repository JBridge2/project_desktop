import QtQuick
import Quickshell

Rectangle {
    id: root

    width: 28
    height: 28
    radius: 14
    color: "#4c566a"

    Image {
        anchors.centerIn: parent
        source: Qt.resolvedUrl("../../../Assets/Icons/Control_Center_Icon.svg")
        width: 20
        height: 20
    }

    MouseArea {
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        onClicked: controlCenterPopup.visible = !controlCenterPopup.visible
    }

    ControlCenterPopup {
        id: controlCenterPopup
        visible: false
    }
}