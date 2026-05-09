import QtQuick
import QtQuick.Layouts
import Quickshell
import Core
import Domain

Rectangle {
    id: root
    
    Layout.fillWidth: true
    height: 50
    radius: 10
    color: "#3d3d3d"

    // -------------------- User text input ------------------------------
    TextInput {
        id: input

        anchors.fill: parent
        anchors.margins: 10
        verticalAlignment: TextInput.AlignVCenter

        color: "white"
        font.pixelSize: 16 
        onTextChanged: {
            AppRegistry.searchApps(text)
        }
        focus: true
        Keys.onEscapePressed: PopupState.close()
        Keys.onEnterPressed: Launcher.launchApp(AppRegistry.filteredApps[results.gridView.currentIndex])
    }

    // -------------------- Text on empty ------------------------------
    Text {
        anchors.fill: parent
        anchors.margins: 10
        verticalAlignment: Text.AlignVCenter
        visible: input.text.length === 0

        text: "Search Applications"
        color: "#d2d2d2"
        font.pixelSize: 16

        opacity: input.text.length === 0 ? 1 : 0
        Behavior on opacity {
            NumberAnimation { duration: 120 }
        }
    }

    function clearText() {
        input.text = ""
        input.forceActiveFocus()
    }
}