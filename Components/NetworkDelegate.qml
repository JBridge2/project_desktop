

import QtQuick
import QtQuick.Layouts 1.15

Rectangle {
    property string ssid: "Network Name"
    
    width: parent ? parent.width : 280
    height: 40
    radius: 10
    color: mouseArea.containsMouse ? "#555555" : "Transparent"
    
    RowLayout {
    anchors.fill: parent
    spacing: 10

        Rectangle {
            radius: 15
            width: 30
            height: 30
            Layout.leftMargin: 5
            color: "blue"
            Text {
                text: "󰖩"
                font.pixelSize: 20
                color: "white"
                anchors.centerIn: parent
            }
        }
        
        Text {
            text: ssid
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