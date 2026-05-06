pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts 1.15

Rectangle {
    id: root
    property string name: ""
    property url image: ""
    property int imageSize: 22
    property bool connected: false

    default property alias icon: iconPlaceholder.data
    signal clicked()

    width: parent ? parent.width : 280
    height: 40
    radius: 10
    color: mouseArea.containsMouse ? "#555555" : "Transparent"
    
    RowLayout {
    anchors.fill: parent
    anchors.margins: 5
    spacing: 10

        Item {
            id: iconPlaceholder
            Layout.preferredWidth: 30
            Layout.preferredHeight: 30

            IconBox {
                visible: iconPlaceholder.children.length <= 1
                size: 30
                imageUrl: root.image
                connected: root.connected
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
        cursorShape: pressed ? Qt.ClosedHandCursor : Qt.PointingHandCursor
        hoverEnabled: true
        onClicked: {
            root.clicked()
        }
    }
}