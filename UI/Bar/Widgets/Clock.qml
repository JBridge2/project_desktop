import QtQuick
import QtQuick.Layouts
import Quickshell

Rectangle {
  	id: clockRoot
  	anchors.centerIn: parent
  	height: 40
  	width: clockText.implicitWidth + 20
  	radius: 10
  	color: "Transparent"

  	ColumnLayout {
		id: clockText
		anchors.fill: parent
		anchors.leftMargin: 10
		spacing: -4

		SystemClock {
			id: clock
			precision: SystemClock.Minutes
		}

    	Text {
      		id: timeText

      		text: Qt.formatDateTime(clock.date, "hh:mm - dddd, d MMM" )
      		color: "white"
      		font.pixelSize: 16
			font.bold: true
    	}
	}
}