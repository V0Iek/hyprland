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
    property var wifi: {
      if (device.type === DeviceType.Wifi) return device.networks.values.find(n => n.connected)
    }

    readonly property string icon: {
      if (!device) return String.fromCodePoint(0xf092d)
      if (device.type === DeviceType.Wired) return String.fromCodePoint(0xef44)

      if (wifi) {
        if (wifi.signalStrength > 0.75) return String.fromCodePoint(0xf0928)
        if (wifi.signalStrength > 0.50) return String.fromCodePoint(0xf0925)
        if (wifi.signalStrength > 0.25) return String.fromCodePoint(0xf0922)
        if (wifi.signalStrength > 0) return String.fromCodePoint(0xf091f)
      }

      return "Connected"
    }

    readonly property string text: {
      if (!device) return "Disconnected"
      if (device.type === DeviceType.Wifi) return wifi.name

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
