pragma Singleton

import QtQuick
import Quickshell

Singleton {
    id: root

    property string activePopup: ""

    function open(name: string) { activePopup = name }
    function close() { activePopup = "" }
    function toggle(name: string) { activePopup = (activePopup === name ? "" : name) }
    function isOpen(name: string): bool { return activePopup === name }
}