import Quickshell
import QtQuick
import QtQuick.Layouts 1.15
import Components
import Core
import Services

PopupWindow {
  	id: root

  	anchorSide: "right"

    // -------------------- Toggles ------------------------------
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

    Separator {}

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

    Separator {}

    // -------------------- Known Networks ------------------------------
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

    Separator {}

    // -------------------- Available Networks ------------------------------
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
}
