import QtQuick
import Core
import Config

Rectangle {
    id: root

    property string popupName: ""
    property int imageSize: 26
    property url imageUrl: ""
    
    width: 40
    height: 40
    radius: 5
    color: PopupState.isOpen(root.popupName) ? Colors.surfaceHigh : "Transparent"

    Image {
        anchors.centerIn: parent
        source: imageUrl
        fillMode: Image.PreserveAspectFit
        smooth: true
        width: imageSize
        height: imageSize
        sourceSize: Qt.size(imageSize, imageSize)
    }

    MouseArea {
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        onClicked: PopupState.toggle(root.popupName)
    }
}