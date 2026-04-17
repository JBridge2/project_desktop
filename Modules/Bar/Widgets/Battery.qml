import Quickshell
import Quickshell.Services.UPower
import QtQuick

Rectangle {
  id: batteryRoot

  readonly property bool batCharging: UPower.displayDevice.state == UPowerDeviceState.Charging
  readonly property real batPercentage: UPower.displayDevice.percentage

  width: batteryContainer.width + 20
  height: 26
  radius: height/2
  color: "transparent"

  Item {
    id: batteryContainer

    anchors.centerIn: parent
    width: 28
    height: 14
    
    Rectangle {
      id: batteryShell

      anchors.fill: parent
      color: "transparent"
      border.color: "#b1a7a6"
      border.width: 1
      radius: 5

      Rectangle {
        id: batteryFill

        x: 2.5
        y: 2.5
        width: (parent.width - x*2) * batPercentage
        height: parent.height - y*2
        radius: 3

        color: {
          if (batPercentage < 0.2) return "red"
          if (batPercentage > 0.8) return "green"
          else return "white"
        } 
      }
    }

    Rectangle {
      id: batteryTip

      width: 2
      height: 5
      anchors.left: batteryShell.right
      anchors.leftMargin: 0.5
      anchors.verticalCenter: parent.verticalCenter
      topRightRadius: 3
      bottomRightRadius: 3
      antialiasing: true
      color: "#b1a7a6"
    }

    Text {
      id: bolt

      anchors.centerIn: parent
      text: "\uf0e7"
      font.family: "JetBrainsMono Nerd Font"
      font.pixelSize: 13
      color: "white"
      style: Text.Outline
      styleColor: "black"
      transform: Scale {
        yScale: 1.4
        origin.y: bolt.height/2
      }
      visible: batCharging
    }
  }
 }
