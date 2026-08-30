import Quickshell
import Quickshell.Services.UPower
import QtQuick
import QtQuick.Layouts

Rectangle {
  implicitHeight: 36
  implicitWidth: root.implicitWidth + 20
  
  color: Colors.bg

  radius: height / 2

  Behavior on implicitWidth {
    PropertyAnimation { duration: 150 }
  }

  RowLayout {
    id: root
    anchors.centerIn: parent
    spacing: 5

    property var battery: UPower.devices.values.find(b => b.isLaptopBattery)

    property int percentage: Math.round(battery.percentage * 100)

    property string icon: {
      if (battery.changeRate < 0) return String.fromCodePoint(0xf06a5)
      if (percentage > 80) return String.fromCodePoint(0xf240)
      if (percentage > 60) return String.fromCodePoint(0xf241)
      if (percentage > 40) return String.fromCodePoint(0xf242)
      if (percentage > 20) return String.fromCodePoint(0xf243)
      return String.fromCodePoint(0xf244)
    }

    property color color: {
      if (percentage > 80) return Colors.bat3
      if (percentage > 60) return Colors.bat3
      if (percentage > 40) return Colors.bat2
      if (percentage > 20) return Colors.bat1
      return Colors.bat0
    }

    Text {
      text: root.icon
      font {
        family: "JetBrainsMono Nerd Font Propo"
        pixelSize: 16
      }

      color: root.color
    }

    Text {
      text: root.percentage + "%"
    
      font {
        family: "FiraSans"
        pixelSize: 16
        weight: 700
      }

      color: root.color
    }
  }
}
