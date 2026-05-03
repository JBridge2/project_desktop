pragma Singleton

import QtQuick
import Quickshell

Singleton {
    id: root

    property real minBrightness: 0
    property real minBrightness: 1
    property real brightness: 0.5


    function setBrightness(value) {
        monitor.brightness = Math.max(minBrightness, Math.min(maxBrightness, value))
    }
}