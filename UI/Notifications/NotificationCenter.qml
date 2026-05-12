import QtQuick
import QtQuick.Layouts
import Quickshell
import Components
import Services

PopupWindow {
    id: root

    anchorSide: "right"

    // -------------------- Header ------------------------------
    RowLayout {
        Layout.fillWidth: true

        Text {
            text: "Notifications"
            color: "white"
            font.pixelSize: 16
            font.bold: true
        }

        Item { Layout.fillWidth: true }

        Rectangle {
            
            width: 70
            height: 24
            radius: 12
            color: "#3c3c3c"
            border.width: 1
            border.color: "#5c5c5c"
            
            Text {
                anchors.centerIn: parent
                text: "Clear All"
                color: "#a0a0a0"
                font.pixelSize: 11
            }

            MouseArea {
                anchors.fill: parent
                onClicked: NotificationService.clearAll()
            }
        }
    }

    Separator {}

    // -------------------- Empty state ------------------------------
    Text {
        Layout.alignment: Qt.AlignHCenter
        visible: NotificationService.notificationsModel.values.length === 0
        text: "No notifications"
        color: "#6d6d6d"
        font.pixelSize: 13
    }

    // -------------------- Notifications List ------------------------------
    ListView {
        id: listView
        Layout.fillWidth: true
        implicitHeight: contentHeight
        spacing: 5

        model: NotificationService.notificationsModel

        delegate: Item {
            width: listView.width
            height: 80
            
            ToastContent {
                notifImage: modelData?.image ?? ""
                notifAppName: modelData?.appName ?? ""
                notifSummary: modelData?.summary ?? ""
                notifBody: modelData?.body ?? ""
            }

            Rectangle {
                anchors { top: parent.top; right: parent.right; margins: 5 }
                width: 20
                height: 20
                radius: 10
                color: "#5d5d5d"

                Text {
                    anchors.centerIn: parent
                    text: "x"
                    color: "white"
                    font.pixelSize: 14
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: NotificationService.dismissNotification(modelData)
                }
            }

        }
    }
}