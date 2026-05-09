import QtQuick
import QtQuick.Layouts 1.15
import Quickshell
import "./Widgets"

import Core

PanelWindow {
  id: root

  anchors {
    top: true
    left: true
    right: true
  }
  
  implicitHeight: 40
  color: "#333333"

  RowLayout {
    anchors {
      fill: parent
      leftMargin: 10
      rightMargin: 10
    }
    spacing: 0

    Workspaces {}

    Item {
      Layout.fillWidth: true
    }

    ControlCenterButton {}

    Network {} 

    Battery {}

    Power {}
  }

  Clock {}
}
