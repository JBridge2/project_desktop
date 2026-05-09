pragma ComponentBehavior: Bound

import QtQuick

Rectangle {
  id: root

  property bool checked: false
  signal toggleChanged()

  width: 50
  height: 30
  radius: height / 2
  color: checked ? "#4cd137" : "#757577"

  Rectangle {
    id: ball

    anchors.verticalCenter: parent.verticalCenter

    width: parent.height - 4
    height: parent.height -4
    radius: height / 2
    color: "white"
    border.width: 1
    border.color: "#dcdde1"
    x: checked ? parent.width - width - 2 : 2

    Behavior on x {
      NumberAnimation {
        duration: 200
        easing.type: Easing.InOutQuad
      }
    }
  }

  MouseArea {
    id: mouseArea
    anchors.fill: parent
    cursorShape: Qt.PointingHandCursor
    onClicked: root.toggleChanged()
  }

  Behavior on color {
    ColorAnimation {
      duration: 200
      easing.type: Easing.InOutQuad
    }
  }
}