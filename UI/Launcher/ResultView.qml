import QtQuick
import QtQuick.Layouts
import Quickshell
import Domain

Rectangle {
    id: root

    property alias gridView: gridView
    
    property int cellSize: 100

    Layout.fillWidth: true
    height: 600
    
    radius: 10
    color: "#4d4d4d"

    GridView {
        id: gridView

        anchors.fill: parent

        cellWidth: cellSize
        cellHeight: cellSize + 20

        model: AppRegistry.filteredApps

        delegate: Item {
            id: delegateRoot

            property bool isFocused: GridView.isCurrentItem

            width: gridView.cellWidth
            height: gridView.cellHeight
            clip: true

            ColumnLayout {
                anchors.centerIn: parent

                Item {
                    Layout.alignment: Qt.AlignHCenter
                    width: cellSize * 0.9
                    height: cellSize * 0.9
            
                    Rectangle {
                        id: iconHighlight

                        anchors.centerIn: iconFrame
                        width: iconFrame.width + 10
                        height: iconFrame.height + 10
                        radius: 20
                        color: "Transparent"
                        border.width: 2
                        border.color: "#a1a1a1"
                        opacity: mouseArea.containsMouse ? 1 : 0
                    }

                    Rectangle {
                        id: iconFrame

                        anchors.centerIn: parent
                        width: parent.width * 0.8
                        height: parent.height * 0.8
                        radius: 15
                        color: "#5f5f5f"

                        Image {
                            anchors.centerIn: parent
                            source: AppRegistry.getIcon(modelData.icon)
                            fillMode: Image.PreserveAspectFit
                            smooth: true
                            width: parent.width * 0.7
                            height: parent.height * 0.7
                            sourceSize: Qt.size(parent.width * 0.7, parent.height * 0.7)
                        }
                    }
                    MouseArea {
                        id: mouseArea
                        anchors.fill: parent
                        hoverEnabled: true
                        onClicked: AppRegistry.launchApp(modelData)
                    }
                }
                Text {
                    Layout.alignment: Qt.AlignHCenter
                    text: modelData.name
                    color: "white"
                    font.pixelSize: 9
                }
            }
            
        }
    }
}