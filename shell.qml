import QtQuick
import Quickshell
import Quickshell.Hyprland
import "./UI/Bar/"
import "./UI/Launcher/"
import "./UI/Popups/"
import Core

ShellRoot {
  	id: root

  	Launcher {
		visible: PopupState.isOpen("launcher")
  	}

  	Bar {}

  	// -------------------- Popup's ------------------------------
  	NetworkPopup {
		visible: PopupState.isOpen("network")
  	}
  	BatteryPopup {
    	visible: PopupState.isOpen("battery")
  	}
  	PowerPopup {
    	visible: PopupState.isOpen("power")
  	}
  	ControlCenterPopup {
    	visible: PopupState.isOpen("controlCenter")
  	}
  	BluetoothPopup {
    	visible: PopupState.isOpen("bluetooth")
  	}
  	AudioPopup {
    	visible: PopupState.isOpen("audio")
  	}

	// -------------------- Keybinds ------------------------------
	GlobalShortcut {
        name: "launcher"
        description: "Open app launcher"
        onPressed: PopupState.toggle("launcher")
    }
} 
