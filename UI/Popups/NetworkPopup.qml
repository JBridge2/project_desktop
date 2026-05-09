import Quickshell
import QtQuick
import QtQuick.Layouts 1.15
import Components
import Core
import Services

PopupWindow {
  id: root

  anchorSide: "right"

  implicitWidth: 300
  implicitHeight: main.implicitHeight + 20

  Rectangle {
    anchors.fill: parent
    radius: 10
    color: "#3c3c3c"

    ColumnLayout {
      id: main
      anchors.fill: parent
      anchors.margins: 10
      spacing: 10

      //---------- Toggles ----------
      RowLayout {
        id: ethernetToggle

        Text {
          text: "Ethernet: "
          font.pixelSize: 16
          font.bold: true
          color: "white"
        }
        Item {
          Layout.fillWidth: true
        }
        Toggle {
          checked: NetworkService.ethernetEnabled
          onToggleChanged: NetworkService.toggleEthernet()
        }
      }

      Rectangle {
        Layout.fillWidth: true
        Layout.preferredHeight: 1
        color: "white"
      }

      RowLayout {
        id: wifiToggle
        Text {
          text: "Wifi: "
          font.pixelSize: 16
          font.bold: true
          color: "white"
        }
        Item {
          Layout.fillWidth: true
        }
        Toggle {
          checked: NetworkService.wifiEnabled
          onToggleChanged: NetworkService.toggleWifi()
        }
      }

      Rectangle {
        Layout.fillWidth: true
        Layout.preferredHeight: 1
        color: "white"
      }


      //---------- Known Networks ----------
      Text {
        text: "Known Networks"
        font.pixelSize: 16
        color: "white"
      }

      ListView {
        id: knownWifiList
        model: NetworkService.wifiEnabled ? NetworkService.knownFilteredWifiModel : []

        Layout.fillWidth: true
        implicitHeight: contentHeight
        
        delegate: Delegate {
          name: model.ssid
          WifiIcon {
            size: 30
            signalStrength: model.strength
          }
        }
      }

      Rectangle {
        Layout.fillWidth: true
        Layout.preferredHeight: 1
        color: "white"
      }

      //---------- Available Networks ----------
      Text {
        text: "Available Networks"
        font.pixelSize: 16
        color: "white"
      }

      ListView {
        id: availableWifiList
        model: NetworkService.wifiEnabled ? NetworkService.availableFilteredWifiModel : []

        Layout.fillWidth: true
        implicitHeight: contentHeight

        delegate: Delegate {
          name: model.ssid
          WifiIcon {
            size: 30
            signalStrength: model.strength
          }
        }
      }

      Rectangle {
        Layout.fillWidth: true
        Layout.preferredHeight: 1
        color: "white"
      }

      Item {
        Layout.fillWidth: true
        Layout.fillHeight: true
      }
    }
  }
}
