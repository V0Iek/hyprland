import Quickshell
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

Rectangle{
  implicitHeight: 36
  implicitWidth: layout.implicitWidth + 12

  color: Colors.bg

  radius: 100

  RowLayout {
    id: layout
    
    anchors.centerIn: parent

    spacing: 5

    Repeater {
      model: 5

      Rectangle {
        id: wsButton

        required property int index

        property var ws: Hyprland.workspaces.values.find(w => w.id === index + 1)
        property bool isActive: Hyprland.focusedWorkspace?.id === (index + 1)

        implicitWidth: isActive ? label.implicitWidth + 40 : label.implicitWidth + 20
        implicitHeight: 28
        radius: height / 2
        color: isActive ? Colors.wsActiveBg : Colors.wsInactiveBg

        Behavior on color {
          ColorAnimation { duration: 400 }
        }

        Behavior on implicitWidth {
          PropertyAnimation { duration: 400 }
        }

        Text {
          id: label

          anchors.centerIn: parent

          text: wsButton.index + 1

          font {
            family: "FiraSans"
            pixelSize: 16
            weight: isActive ? 700 : 600
          }
  
          color: wsButton.isActive ? Colors.bg : (ws ? Colors.text : Colors.wsInactiveBg)
        }

        MouseArea {
          anchors.fill: parent

          onClicked: Hyprland.dispatch("hl.dsp.focus({ workspace = " + (parent.index + 1) + " })")
        }
      }
    }
  }
}
