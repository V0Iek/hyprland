import Quickshell
import Quickshell.Io
import QtQuick

Rectangle {
  implicitHeight: 36
  implicitWidth: text.implicitWidth + 20

  color: Colors.bg

  radius: height / 2
  
  Text {
    id: text

    anchors.centerIn: parent

    text: String.fromCodePoint(0xf08c7)

    font {
      family: "Jetbrains Mono Nerd Font Propo"
      pixelSize: 20
    }
    
    color: Colors.appMenu
  }

  Process {
    id: launcher
    command: [ "rofi", "-show", "drun" ]
  }

  MouseArea {
    anchors.fill: parent
    cursorShape: Qt.PointingHandCursor

    onClicked: { launcher.running = true }
  }
}
