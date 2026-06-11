pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland
import "../../Core/"
import Config

PanelWindow {
    id: root

    default property alias content: contentPlaceholder.data

    property string anchorSide: "right"
    property int width: 360
    property int innerMargins: 15
    property int columnSpacing: 10

    anchors {
        top: true
        left: anchorSide === "left"
        right: anchorSide === "right"
    }
    margins {top: 10; left: 10; right: 10;}

    implicitWidth: width
    implicitHeight: contentPlaceholder.implicitHeight + (innerMargins * 2)
    color: "transparent"

    HyprlandFocusGrab {
        windows: [root]
        active: root.visible
        onCleared: PopupState.close()
    }

    Rectangle {
        anchors.fill: parent
        radius: 10
        color: Colors.surface
        border.width: 1
        border.color: Colors.border

        ColumnLayout {
            id: contentPlaceholder

            anchors.fill: parent
            anchors.margins: innerMargins
            spacing: columnSpacing
        }
    }
}