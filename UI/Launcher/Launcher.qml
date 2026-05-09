import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland
import Core

PanelWindow {
    id: root

    anchors { top: true; bottom: true; left: true; right:true}
    exclusionMode: ExclusionMode.Ignore
    color: "Transparent"
    
    focusable: true

    onVisibleChanged: {
        if (visible) searchBar.clearText()
    }

    // -------------------- Background Blur ------------------------------
    Rectangle {
        id: backgroundBlur
        anchors.fill: parent
        gradient: Gradient {
            orientation: Gradient.Vertical
            GradientStop { position: 0.0;  color: Qt.rgba(0, 0, 0, 0.88) }
            GradientStop { position: 0.42; color: Qt.rgba(0, 0, 0, 0.74) }
            GradientStop { position: 1.0;  color: Qt.rgba(0, 0, 0, 0.88) }
        }

        MouseArea {
            anchors.fill: parent
            onClicked: PopupState.close()
        }
    }

    // -------------------- App Launcher UI ------------------------------
    ColumnLayout {
        id: main
        anchors.centerIn: parent
        width: 800

        SearchBar {
            id: searchBar
        }
        
        ResultView {
            id: results
        }
    }
}