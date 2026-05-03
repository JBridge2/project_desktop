pragma ComponentBehavior: Bound

import QtQuick
import Quickshell
import Quickshell.Hyprland
import "../Services"

PanelWindow {
    id: root

    property string anchorSide: "right"

    anchors {
        top: true
        left: anchorSide === "left"
        right: anchorSide === "right"
    }
    margins {top: 10; left: 10; right: 10;}
    implicitWidth: 360
    implicitHeight: 400
    color: "transparent"
    focusable: true

    HyprlandFocusGrab {
        windows: [root]
        active: root.visible
        onCleared: PopupState.close()
    }
}