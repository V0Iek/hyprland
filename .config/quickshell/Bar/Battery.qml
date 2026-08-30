import Quickshell
import Quickshell.Services.UPower
import QtQuick
import QtQuick.Layouts

Scope {
  id: root

  property var battery: UPower.devices.values.find(b => b.isLaptopBattery)

  property bool visible: root.battery !== undefined && root.battery !== null

  property int percentage: root.visible ? Math.round(battery.percentage * 100) : 0

  property string icon: {
    if (!visible) return ""
    if (battery.changeRate < 0) return String.fromCodePoint(0xf06a5)
    if (percentage > 80) return String.fromCodePoint(0xf240)
    if (percentage > 60) return String.fromCodePoint(0xf241)
    if (percentage > 40) return String.fromCodePoint(0xf242)
    if (percentage > 20) return String.fromCodePoint(0xf243)
    return String.fromCodePoint(0xf244)
  }

  property color color: {
    if (!visible) return null
    if (percentage > 80) return Colors.bat3
    if (percentage > 60) return Colors.bat3
    if (percentage > 40) return Colors.bat2
    if (percentage > 20) return Colors.bat1
    return Colors.bat0
  }

  Rectangle {
    visible: root.visible

    implicitHeight: root.visible ? 36 : 0
    implicitWidth: root.implicitWidth + 20
  
    color: Colors.bg

    radius: height / 2
  
    Behavior on implicitWidth {
      PropertyAnimation { duration: 150 }
    }

    RowLayout {
      anchors.centerIn: parent
      spacing: 5

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
}
