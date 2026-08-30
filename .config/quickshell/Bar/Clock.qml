import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Layouts

Rectangle{
  implicitHeight: 36
  implicitWidth: layout.implicitWidth + 20

  color: Colors.bg

  radius: height / 2

  SystemClock {
    id: clock
    precision: SystemClock.Minutes
  }

  RowLayout {
    id: layout

    anchors.centerIn: parent

    spacing: 24

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
    }

    Text {
      id: notify

      text: String.fromCodePoint(0xf009a)

      font {
        family: "JetBrains Mono Nerd Font Propo"
        pixelSize: 16
      }

      color: Colors.appMenu

      Process {
        id: toggleProcess
        command: [ "quickshell", "-p", "/home/michal/.config/quickshell/Notifications", "ipc", "call", "notifications", "toggle" ]
      }

      MouseArea {
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        onClicked: { toggleProcess.running = true; }
      }
    }
  }
}
