

import QtQuick
import QtQuick.Layouts 1.15

Rectangle {
    property string name: ""
    default property alias icon: iconPlaceholder.data

    width: parent ? parent.width : 280
    height: 40
    radius: 10
    color: mouseArea.containsMouse ? "#555555" : "Transparent"
    
    RowLayout {
    anchors.fill: parent
    spacing: 10

        Item {
            id: iconPlaceholder
            Layout.preferredWidth: 30
            Layout.preferredHeight: 30

            Rectangle {
                visible: iconPlaceholder.children.length <= 1
                width: 30; height: 30; radius: 15; color: "#6d6d6d"
            }
        }
        
        Text {
            text: name
            font.pixelSize: 16
            color: "white"
        }
        
        Item {
            Layout.fillWidth: true
        }
    }

    MouseArea {
        id: mouseArea

        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        hoverEnabled: true
        onClicked: {
            console.log("Clicked on network: " + ssid)
        }
    }
}