
import QtQuick
import Quickshell

Rectangle {
    property int size: 40
    property int imageSize: size * 0.6
    property bool connected: false
    property url imageUrl: ""

    width: size
    height: size
    radius: size / 2
    
    color: connected ? "#0080ff" : "#6d6d6d"

    Image {
        anchors.centerIn: parent
        source: imageUrl
        fillMode: Image.PreserveAspectFit
        smooth: true
        width: imageSize
        height: imageSize
        sourceSize: Qt.size(imageSize, imageSize)
    }
}