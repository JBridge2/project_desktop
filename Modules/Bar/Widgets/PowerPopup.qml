import QtQuick
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import Quickshell
import "../../../Components/"

PopupWindow {
    id: root

    // ---------- Icons ----------
    property url iconDir: Qt.resolvedUrl("../../../Assets/Icons/")
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
    implicitWidth: 200
    implicitHeight: main.implicitHeight + 30

    Rectangle {
        anchors.fill: parent
        radius: 10
        color: "#333333"

        ColumnLayout {
            id: main

            anchors {
                fill: parent
                margins: 15
            }
            spacing: 10

            PowerButton {
                name: "Sleep"
                icon: sleepIcon
                powerOption: sleepCommand
            }

            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 1
                color: "gray"
            }

            PowerButton {
                name: "Restart"
                icon: restartIcon
                powerOption: restartCommand
            }

            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 1
                color: "gray"
            }

            PowerButton {
                name: "Shutdown"
                icon: shutdownIcon
                powerOption: shutdownCommand
            }

            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 1
                color: "gray"
            }

            PowerButton {
                name: "Lock"
                icon: lockIcon
                powerOption: lockCommand
            }

            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 1
                color: "gray"
            }

            PowerButton {
                name: "Logout"
                icon: logoutIcon
                powerOption: logoutCommand
            }
        }
    }
}