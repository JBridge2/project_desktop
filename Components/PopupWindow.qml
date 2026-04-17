pragma ComponentBehavior: Bound

import Quickshell
import QtQuick

PanelWindow {
  id: root

  property string anchorSide: "left"

  anchors {
    top: true
    left: anchorSide === "left"
    right: anchorSide === "right"
  }

  margins {
    top: 10
    left: 10
    right: 10
  }

  implicitWidth: 300
  implicitHeight: 400
  color: "transparent"
}
