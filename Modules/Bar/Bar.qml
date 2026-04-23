import Quickshell
import QtQuick
import QtQuick.Layouts 1.15
import "./Widgets"

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
    spacing: 10

    Workspaces {}

    Item {
      Layout.fillWidth: true
    }

    Network {} 

    Battery {}

    Power {}
  }

  Clock {}
}
