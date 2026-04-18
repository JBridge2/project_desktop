pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts 1.15

Rectangle {
    property string ssid: "Network Name"
    
    width: parent.width
    height: 35
    color: "transparent"
    
    RowLayout {
    anchors.fill: parent
    spacing: 10

        Rectangle {
            radius: 15
            width: 30
            height: 30
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
}