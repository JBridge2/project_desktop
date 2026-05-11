import QtQuick
import QtQuick.Layouts
import Components
import Services

Rectangle {

    property url notifImage: ""
    property string notifAppName: ""
    property string notifSummary: ""
    property string notifBody: ""

    anchors.fill: parent
    radius: 10
    color: "#2c2c2c"
    border.width: 1
    border.color: "#4d4d4d"

    RowLayout {
        anchors.fill: parent
        anchors.margins: 15
        spacing: 20

        IconBox {
            imageUrl: notifImage
        }

        ColumnLayout {
            spacing: 2

            Text {
                text: notifAppName
                color: "#a0a0a0"
                font.pixelSize: 11
            }
            Text {
                text: notifSummary
                color: "white"
                font.pixelSize: 13
            }
            Text {
                text: notifBody
                color: "#d0d0d0"
                font.pixelSize: 11
            }
        }
        Item {
            Layout.fillWidth: true
        }
    }
}