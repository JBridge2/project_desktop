
import QtQuick
import Quickshell

Rectangle {
    property int size: 40
    property int rectRadius: size / 2
    property var rectColor: connected ? "#0080ff" : "#6d6d6d"
    property int imageSize: size * 0.6
    property bool connected: false
    property url imageUrl: ""

    width: size
    height: size
    radius: rectRadius
    
    color: rectColor

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