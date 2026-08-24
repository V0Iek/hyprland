import Quickshell
import QtQuick

Rectangle{
  implicitHeight: 36
  implicitWidth: text.implicitWidth + 20

  color: Colors.bg

  radius: height / 2
  
  Text {
    id: text

    anchors.centerIn: parent

    text: Qt.formatDateTime(clock.date, "dd MMM hh:mm")

    font {
      family: "FiraSans"
      pixelSize: 16
      weight: 700
    }
    
    color: Colors.text

    SystemClock {
      id: clock
      precision: SystemClock.Minutes
    }
  }
}
