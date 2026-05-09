pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io
import Core

Singleton {
    id: root

    property var apps: []
    property var filteredApps: []

    // -------------------- Get Icons ------------------------------
    function getIcon(iconName) {
        if (!iconName || iconName.trim() === "") 
            return Quickshell.iconPath("application-x-executable")
        var path = Quickshell.iconPath(iconName)
        if (path.toString() === "")
            return Quickshell.iconPath("application-x-executable")
        return Quickshell.iconPath(iconName)
    }


    // -------------------- Filtered Apps ------------------------------
    function searchApps(query) {
        if (query === "") {
            filteredApps = apps
            return
        }

        filteredApps = apps.filter(app => 
            app.name.toLowerCase().includes(query.toLowerCase())
        )

    }


    // -------------------- Load Apps ------------------------------
    Process {
        id: appLoader
        command: ["python3", Quickshell.env("HOME") + "/.config/quickshell/project_desktop/Scripts/Apps.py"]
        stdout: StdioCollector {
            onStreamFinished: {
                try {
                    root.apps = JSON.parse(this.text)
                    root.filteredApps = root.apps.slice()
                } catch (e) {
                    console.error("JSON Parse Error: " + e)
                }
            }
        }
    }

    function loadApps() {
        appLoader.running = true
    }

    Component.onCompleted: {
        loadApps()
    }


    // -------------------- Launch App ------------------------------
    function launchApp(app) {
        if (!app) return
        PopupState.close()
        var exec = app.exec.replace(/%[uUfF]/g, "").trim()
        var proc = Qt.createQmlObject('import Quickshell.Io; Process {}', root)
        proc.command = exec.split(" ")
        proc.running = true
    }
}