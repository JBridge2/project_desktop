import Quickshell
import "./Modules/Bar/"
import "./Modules/Popups/"
import "./Services/"

ShellRoot {
  id: root

  Bar {}


  //---------- Popup's ----------
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
} 
