pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
  id: root

  property bool ethernetEnabled: true
  property bool wifiEnabled: true
  property bool ethernetConnected: false
  property bool wifiConnected: false
  property int wifiStrength: 0
  property string ssid: "Disconnected" 

  property alias knownWifiModel: _knownWifiModel

  //Check if ethernet is connected
  Process {
    id: ethernetStatusProc
    running: true
    command: ["sh", "-c", "nmcli -t -f TYPE,STATE dev | grep 'ethernet'"]
    stdout: SplitParser {
      onRead: data => {
        if (data) root.ethernetConnected = (data.trim() === "ethernet:connected")
      }
    }
    
  }

  //Check if wifi is connected
  Process {
    id: wifiStatusproc
    running: true
    command: ["nmcli", "-t", "-f", "TYPE,STATE", "device"]
    stdout: SplitParser {
      onRead: (line) => {
        let parts = line.split(":");
        if (parts[0] === "wifi") {
          wifiConnected = (parts[1] === "connected")
        }
      }
    }
    
  }

  //Check wifi strength
  Process {
    id: wifiStrengthProc
    running: true
    command: ["sh", "-c", "nmcli -t -f IN-USE,SIGNAL,SSID device wifi | grep '^\*'"]
    stdout: SplitParser {
      onRead: (line) => {
        let parts = line.split(":");
        wifiStrength = parseInt(parts[1]);
        ssid = parts[2];
      }
    }
  }

  //Update Network in right order
  function updateNetwork() {
    ethernetStatusProc.running = true
    if (!ethernetConnected) {
      wifiStatusproc.running = true
       if (root.wifiConnected) {
         wifiStrengthProc.running = true
        }
      else {
        wifiStrength = 0
        ssid = "Disconnected"
      }
    }
    else {
        wifiConnected = false
        ssid = "Ethernet Active"
    }
  }

  //---------- Get Wifi ----------
  ListModel {
    id: _knownWifiModel
  }

  Process {
    id: knownWifiProc
    command: ["sh", "-c", "nmcli -t -f NAME,TYPE connection show | grep '802-11-wireless'"]
    stdout: SplitParser {
      onRead: (line) => {
        let parts = line.split(":");
        let ssidName = parts[0];
        
        // Check if SSID already exists in model
        let exists = false;
        for (let i = 0; i < knownWifiModel.count; i++) {
          if (knownWifiModel.get(i).ssid === ssidName) {
            exists = true;
            break;
          }
        }
        
        // Only append if not already in model
        if (!exists) {
          knownWifiModel.append({ "ssid": ssidName});
        }
      }
    }
  }

  //Update every 5 seconds
  Timer {
    interval: 5000
    running: true
    repeat: true
    triggeredOnStart: true
    onTriggered: {
      updateNetwork();
      knownWifiProc.running = true
    }
  }
}
