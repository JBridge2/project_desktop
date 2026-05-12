import QtQuick
import QtQuick.Layouts
import Quickshell
import Components
import Services

PanelWindow {
    id: root

    anchors { top: true; right: true }
    margins { top: 10; right: 10 }

    implicitWidth: 360
    implicitHeight: 80
    color: "Transparent"
    visible: NotificationService.currentToast !== null

    ToastContent {
        notifImage: NotificationService.currentToast?.image ?? ""
        notifAppName: NotificationService.currentToast?.appName ?? ""
        notifSummary: NotificationService.currentToast?.summary ?? ""
        notifBody: NotificationService.currentToast?.body ?? ""

        // -------------------- Slide in animation ------------------------------
        transform: Translate {
            x: root.visible ? 0 : 400
            Behavior on x {
                NumberAnimation { duration: 250; easing.type: Easing.OutCubic }
            }
        }
    }
    MouseArea {
        anchors.fill: parent
        onClicked: NotificationService.dismissToast()
    }
}