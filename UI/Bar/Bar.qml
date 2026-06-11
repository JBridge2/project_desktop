import QtQuick
import QtQuick.Layouts 1.15
import Quickshell
import "./Widgets"
import Config
import Core

PanelWindow {
  	id: root

  	anchors {
    	top: true
    	left: true
    	right: true
  	}
  
  	implicitHeight: 40
  	color: Colors.base

  	RowLayout {
    	anchors.fill: parent
    	spacing: 0

		Arch {}

    	Workspaces {}

    	Item {
      		Layout.fillWidth: true
    	}

    	ControlCenterButton {}

    	Network {} 

    	Battery {}

    	Power {}
  	}

  	Clock {}
}