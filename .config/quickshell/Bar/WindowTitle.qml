import Quickshell
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

Rectangle {
  implicitHeight: 36
  implicitWidth: root.width + 20
  
  color: Colors.bg

  radius: height / 2

  Behavior on implicitWidth {
    PropertyAnimation { duration: 150 }
  }

  Text {
    id: root

    width: Math.min(implicitWidth, 200)

    anchors.centerIn: parent

    text: Hyprland.activeToplevel.title

    elide: Text.ElideRight

    font {
      family: "FiraSans"
      pixelSize: 16
      weight: 700
    }
    
    color: Colors.text
  }
}
