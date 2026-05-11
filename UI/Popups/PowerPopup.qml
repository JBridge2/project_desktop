import QtQuick
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import Quickshell
import Components
import Core

PopupWindow {
    id: root

    // ---------- Icons ----------
    property url iconDir: Qt.resolvedUrl("../../Assets/Icons/")
    property url shutdownIcon: iconDir + "shutdown.svg"
    property url restartIcon: iconDir + "restart.svg"
    property url sleepIcon: iconDir + "sleep.svg"
    property url lockIcon: iconDir + "lock.svg"
    property url logoutIcon: iconDir + "logout.svg"

    // ---------- Commands ----------
    property var shutdownCommand: ["systemctl", "poweroff"]
    property var restartCommand: ["systemctl", "reboot"]
    property var sleepCommand: ["systemctl", "suspend"]
    property var lockCommand: ["loginctl", "lock-session"]
    property var logoutCommand: ["loginctl", "terminate-session"]

    anchorSide: "right"
    width: 150
    innerMargins: 0
    columnSpacing: 0

    PowerButton {
        name: "Sleep"
        icon: sleepIcon
        powerOption: sleepCommand
    }

    Separator {}

    PowerButton {
        name: "Restart"
        icon: restartIcon
        powerOption: restartCommand
    }

    Separator {}

    PowerButton {
        name: "Shutdown"
        icon: shutdownIcon
        powerOption: shutdownCommand
    }

    Separator {}

    PowerButton {
        name: "Lock"
        icon: lockIcon
        powerOption: lockCommand
    }

    Separator {}

    PowerButton {
        name: "Log out"
        icon: logoutIcon
        powerOption: logoutCommand
    }
}