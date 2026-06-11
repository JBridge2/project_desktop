import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.UPower
import Components
import Core
import Config

PopupWindow {
    id: root

    property real batPercentage: UPower.displayDevice.percentage
    property int batTimeSek: UPower.displayDevice.timeToEmpty
    property int batTimeHours: Math.floor(batTimeSek / 3600);
    property int batTimeMinuts: Math.floor((batTimeSek % 3600) / 60);

    anchorSide: "right"
    width: 300

    RowLayout {

        Text {
            text: "Battery"
            color: Colors.text
            font.pixelSize: 16
            font.bold: true
        }
        Item {
            Layout.fillWidth: true
        }
        Text {
            text: Math.round(batPercentage * 100) + "%"
            color: Colors.text
            font.pixelSize: 16
        }
    }
    Text {
        text: batTimeHours + "h " + batTimeMinuts + "m until battery empty"
        color: Colors.textMuted
        font.pixelSize: 12
    }
}