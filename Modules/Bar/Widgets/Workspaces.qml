import QtQuick
import QtQuick.Layouts 1.15
import Quickshell
import Quickshell.Hyprland

Rectangle {
	id: workspaceRoot

	readonly property int itemHeight: 24
	readonly property int itemWidth: 24
	readonly property int activeItemWidth: itemWidth*2
	readonly property int rowSpacing: 5
	readonly property int visibleCount: workspaceRepeater.count
	readonly property int workspaceWidth: (itemWidth * visibleCount) + (activeItemWidth - itemWidth) + (rowSpacing * (visibleCount - 1))

	color: "transparent"
	width: workspaceWidth
	height: itemHeight
  
	RowLayout {
    	id: workspaceRow

    	anchors.centerIn: parent
	    spacing: rowSpacing

    	Repeater {
    		id: workspaceRepeater
    		model: Hyprland.workspaces

	    	delegate: Rectangle {
    	    	id: workspaceItem

	        	implicitWidth: modelData.active ? activeItemWidth : itemWidth
    	    	implicitHeight: itemHeight
        		radius: itemHeight/2

        		color: modelData.active ? "red" : "#4c566a"

	        	Text {
    	      		anchors.centerIn: parent
        	  		text: modelData.id
    	  		    color: "white"
      				font.pixelSize: 14
        		}

	        	MouseArea {
    	      		anchors.fill: parent
        			cursorShape: Qt.PointingHandCursor
        			onClicked: Hyprland.dispatch("workspace " + modelData.id)
          		}

        		Behavior on implicitWidth {
          			NumberAnimation { duration: 200; easing.type: Easing.OutCubic }
        		}

        		Behavior on color {ColorAnimation {duration: 200}}
      		}
    	}
  	}
}

