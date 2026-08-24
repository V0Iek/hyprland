import Quickshell
import Quickshell.Widgets
import Quickshell.Services.Pipewire
import QtQuick
import QtQuick.Layouts

Scope {
  id: root

  property bool shouldShowOsd: false

  PwObjectTracker {
    objects: [ Pipewire.defaultAudioSink ]
  }

  Connections {
    target: Pipewire.defaultAudioSink?.audio

    function onVolumeChanged() {
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
      implicitWidth: 300
      implicitHeight: 50
      exclusiveZone: 0

      color: "transparent"

      mask: Region {}

      Rectangle {
        anchors.fill: parent
        radius: height / 2
        color: Colors.bg

        RowLayout {
          anchors {
            fill: parent
            leftMargin: 10
            rightMargin: 15
          }

          spacing: 10

          Text {
            readonly property int vol: Math.round(Pipewire.defaultAudioSink.audio.volume * 100)
            readonly property string icon: {
              if (vol === 0) return String.fromCodePoint(0xF0581)
              if (vol < 34) return String.fromCodePoint(0xF057F)
              if (vol < 67) return String.fromCodePoint(0xF0580)

              return String.fromCodePoint(0xF057E)
            }

            text: icon

            font {
              family: "JetBrains Mono Nerd Font Propo"
              pixelSize: 30
            }

            color: Colors.text
          }

          Rectangle{
            Layout.fillWidth: true

            implicitHeight: 10
            radius: 20
            color: Colors.wsInactiveBg

            Rectangle {
              anchors {
                left: parent.left
                top: parent.top
                bottom: parent.bottom
              }

              implicitWidth: parent.width * (Pipewire.defaultAudioSink?.audio.volume ?? 0)
              
              gradient: Gradient {
                GradientStop { position: 0.15; color: Colors.appMenu }
                GradientStop { position: 0.85; color: Colors.wsActiveBg }
                orientation: Gradient.Horizontal
              }
              
              radius: parent.radius
            }
          }
        }
      }
    }
  }
}
