import QtQuick
import Quickshell
import "../Services"

Rectangle {
    id: wifiRoot

    property int size: 40
    property int signalStrength: NetworkService.wifiStrength

    width: size
    height: size
    radius: size / 2
    color: NetworkService.wifiConnected ? "#0080ff" : "#6d6d6d"

    Image {
        anchors.centerIn: parent
        source: Qt.resolvedUrl("../Assets/Icons/Wifi/wifiTopBar.svg")
        fillMode: Image.PreserveAspectFit
        smooth: true
        width: size * 0.7
        height: size * 0.7
        sourceSize: Qt.size(size * 0.7, size * 0.7)
        opacity: signalStrength >= 75 ? 1 : 0.5
    }

    Image {
        anchors.centerIn: parent
        source: Qt.resolvedUrl("../Assets/Icons/Wifi/wifiMiddleBar.svg")
        fillMode: Image.PreserveAspectFit
        smooth: true
        width: size * 0.7
        height: size * 0.7
        sourceSize: Qt.size(size * 0.7, size * 0.7)
        opacity: signalStrength >= 50 ? 1 : 0.5
    }

    Image {
        anchors.centerIn: parent
        source: Qt.resolvedUrl("../Assets/Icons/Wifi/wifiBottomBar.svg")
        fillMode: Image.PreserveAspectFit
        smooth: true
        width: size * 0.7
        height: size * 0.7
        sourceSize: Qt.size(size * 0.7, size * 0.7)
        opacity: signalStrength >= 25 ? 1 : 0.5
    }

    Rectangle {
        id: disconnectedLine
        width: 2
        height: size * 0.7
        radius: 1
        color: "white"
        anchors.centerIn: parent
        rotation: -45
        visible: !NetworkService.wifiConnected
    }

}