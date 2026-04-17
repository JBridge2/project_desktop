import QtQuick

Rectangle {
  id: clockRoot
  anchors.centerIn: parent
  height: 24
  width: clockText.implicitWidth + 20
  radius: height/2
  color: "#222222"

  Text {
    id: clockText

    anchors.centerIn: parent
    text: currentTime
    color: "white"
    font.pixelSize: 14
  }

  property string currentTime: Qt.formatDateTime(new Date(), "HH:mm")

  Timer {
    interval:1000
    running: true
    repeat: true
    onTriggered: currentTime = Qt.formatDateTime(new Date(), "HH:mm")
  }

}
