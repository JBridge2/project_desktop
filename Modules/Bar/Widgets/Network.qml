import Quickshell
import Quickshell.Io
import QtQuick
import "../../../Services"

Rectangle {
  id: wifiRoot

  
  width: 30
  height: 24
  color: "#4c566a"
  radius: 10

  Text {
    id: wifiIcon

    anchors.centerIn: parent
    text: {
      if (NetworkService.ethernetConnected === true) return "󰈀"
      else if (NetworkService.wifiConnected === true) {
        if (NetworkService.wifiStrength >= 66) return "󰖩"
        else if (NetworkService.wifiStrength < 66 && NetworkService.wifiStrength > 33) return "󰤥"
        else if (NetworkService.wifiStrength <= 33) return "󰤢"
      }
      else return "Disconnected 󰖪"
    }
    color: "white"
    font.pixelSize: 18
  }

  MouseArea {
    anchors.fill: parent
    cursorShape: Qt.PointingHandCursor

    onClicked: networkPopup.visible = !networkPopup.visible
  }

  NetworkPopup {
    id: networkPopup
    visible: false
  }
}
