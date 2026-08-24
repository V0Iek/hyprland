
import Quickshell
import Quickshell.Widgets
import Quickshell.Services.Pipewire
import QtQuick
import QtQuick.Layouts

Scope {
  id: root

  property bool shouldShowOsd: false
  readonly property bool muted: Pipewire.defaultAudioSource?.audio.muted

  PwObjectTracker {
    objects: [ Pipewire.defaultAudioSource ]
  }

  Connections {
    target: Pipewire.defaultAudioSource?.audio

    function onMutedChanged() {
      root.shouldShowOsd = true;
      hideTimer.restart();
    }
  }

  Timer {
    id: hideTimer
    interval: 1000
    onTriggered: root.shouldShowOsd = false
  }
  
  LazyLoader {
    active: root.shouldShowOsd

    PanelWindow {
      anchors.bottom: true
      margins.bottom: screen.height / 10
      implicitWidth: layout.implicitWidth + 30
      implicitHeight: 50
      exclusiveZone: 0

      color: "transparent"

      mask: Region {}

      Rectangle {
        anchors.fill: parent
        radius: height / 2
        color: Colors.bg

        RowLayout {
          id: layout

          anchors.centerIn: parent

          Text {
            readonly property string icon: {
              if (root.muted) return String.fromCodePoint(0xf036d)

              return String.fromCodePoint(0xf036c)
            }

            text: icon

            font {
              family: "JetBrains Mono Nerd Font Propo"
              pixelSize: 30
            }

            color: Colors.text
          }

          Text {
            readonly property string info: {
              if (root.muted) return "Muted"
              return "Unmuted"
            }
            
            text: info
            
            font {
              family: "FiraSans"
              pixelSize: 20
              weight: 700
            }
    
            color: Colors.text
          }
        }
      }
    }
  }
}
