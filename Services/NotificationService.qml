pragma Singleton
import QtQuick
import Quickshell
import Quickshell.Services.Notifications

Singleton {
    id: root

    property Notification currentToast: null
    property ScriptModel notificationsModel: ScriptModel { values: [] }
    NotificationServer {
        id: server
        actionsSupported: true
        imageSupported: true
        bodySupported: true
        keepOnReload: true
        bodyMarkupSupported: true

        onNotification: (notif) => {
            notif.tracked = true
            root.currentToast = notif
            dismissTimer.restart()
            notificationsModel.values = [notif].concat(notificationsModel.values)
        }
    }

    Timer {
        id: dismissTimer
        interval: 10000
        onTriggered: root.currentToast = null
    }

    function dismissToast() {
        dismissTimer.stop()
        root.currentToast = null
    }

    function dismissNotification(notif) {
        notif.dismiss()
        notificationsModel.values = notificationsModel.values.filter(n => n !== notif)
    }

    function clearAll() {
        notificationsModel.values.forEach(n => n.dismiss())
        notificationsModel.values = []
        root.currentToast = null
        dismissTimer.stop()
    }
}