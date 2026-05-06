import QtQuick
import QtQuick.Layouts
import Quickshell
import "../../Components/"
import "../../Services/"

PopupWindow2 {
    id: root
    
    anchorSide: "right"
    onVisibleChanged: BluetoothService.bluetoothScan(root.visible)
    
    RowLayout {
        id: bluetoothToggle

        Text {
            text: "Bluetooth "
            color: "white"
            font.pixelSize: 16
            font.bold: true
        }
        Item {
            Layout.fillWidth: true
        }
        Toggle {
            checked: BluetoothService?.adapter.enabled
            onToggleChanged: {
                BluetoothService.toggleBluetooth()
            }
        }
    }

    Rectangle {
        Layout.fillWidth: true
        height: 1
        color: "#7d7d7d"
    }

    Text {
        text: "Paired Devices"
        color: "#d2d2d2"
        font.pixelSize: 14
        font.bold: true
    }

    ListView {
        model: BluetoothService.pairedDevicesModel

        Layout.fillWidth: true
        implicitHeight: contentHeight

        delegate: Delegate {
            name: modelData.name
            image: "bluetooth.svg"
            connected: modelData.connected
            onClicked: modelData.connected ? modelData.disconnect() : modelData.connect()
        }
    }

    Rectangle {
        Layout.fillWidth: true
        height: 1
        color: "#7d7d7d"
    }

    Text {
        text: "Other Devices"
        color: "#d2d2d2"
        font.pixelSize: 14
        font.bold: true
    }

    ListView {
        model: BluetoothService.devicesModel

        Layout.fillWidth: true
        implicitHeight: contentHeight

        delegate: Delegate {
            name: modelData.name
            image: "bluetooth.svg"
            onClicked: {
                modelData.pair()
            }
        }
    }
}