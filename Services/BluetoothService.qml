pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Bluetooth

Singleton {
    id: root

    //---------- toggle Bluetooth ------------
    property BluetoothAdapter adapter: Bluetooth.defaultAdapter

    function toggleBluetooth() {
        if (adapter) adapter.enabled = !adapter.enabled
    }

    //---------- Devices ------------
    property ScriptModel pairedDevicesModel: ScriptModel {
        values: Bluetooth.devices.values.filter(device => device.paired)
    }
    property ScriptModel devicesModel: ScriptModel {
        values: Bluetooth.devices.values.filter(device => !device.paired && device.deviceName)
    }

    function bluetoothScan(active) {
        if (adapter && adapter.enabled) {
            adapter.discovering = active
        }
    }
}