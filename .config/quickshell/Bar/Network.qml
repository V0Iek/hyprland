import Quickshell
import Quickshell.Networking
import QtQuick
import QtQuick.Layouts

Rectangle {
  implicitHeight: 36
  implicitWidth: root.implicitWidth + 20
  
  color: Colors.bg

  radius: height / 2
  
  RowLayout {
    id: root

    anchors.centerIn: parent

    property var device: Networking.devices.values.find(d => d.connected)

    readonly property string icon: {
      if (!device) return String.fromCodePoint(0xf092d)
      if (device.type === DeviceType.Wired) return String.fromCodePoint(0xef44)

      return "Connected"
    }

    readonly property string text: {
      if (!device) return "Disconnected"

      return device.name
    }

    Text {
      text: root.icon

      font {
        family: "JetBrainsMono Nerd Font Propo"
        pixelSize: 16
      }

      color: Colors.network
    }

    Text {
      text: root.text

      font {
        family: "FiraSans"
        pixelSize: 16
        weight: 700
      }
    
      color: Colors.network
    }
  }
}
