import QtQuick
import Quickshell
import Quickshell.Io
import "../../../Components/"
import "../../../Services/"

WifiIcon {
    size: 40
    radius: 5
    color: PopupState.isOpen("network") ? "#4d4d4d" : "transparent"

    MouseArea {
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        onClicked: PopupState.toggle("network")
    }
}
