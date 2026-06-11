import QtQuick
import Core
import Config

Rectangle {
    property string popup: ""

    Layout.fillWidth: true
    height: 70
    radius: 10
    color: Colors.surface
    border.width: 1
    border.color: Colors.border

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onClicked: PopupState.toggle(popup)
    }
}