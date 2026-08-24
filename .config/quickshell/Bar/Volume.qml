import Quickshell
import Quickshell.Services.Pipewire
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

    property var sink: Pipewire.defaultAudioSink

    readonly property bool ready: sink && sink.ready
    readonly property bool muted: ready && sink.audio.muted
    readonly property int vol: ready ? Math.round(sink.audio.volume * 100) : 0

    property var source: Pipewire.defaultAudioSource

    readonly property bool sourceReady: source && source.ready
    readonly property bool sourceMuted: sourceReady && source.audio.muted

    readonly property string icon: {
      if (!ready) return String.fromCodePoint(0xF0581)
      if (muted) return String.fromCodePoint(0xF075F)

      if (vol === 0) return String.fromCodePoint(0xF0581)
      if (vol < 34) return String.fromCodePoint(0xF057F)
      if (vol < 67) return String.fromCodePoint(0xF0580)

      return String.fromCodePoint(0xF057E)
    }

    readonly property string sourceIcon: sourceMuted ? String.fromCodePoint(0xF036D) : ""

    Text {
      text: root.sourceIcon
      font {
        family: "JetBrainsMono Nerd Font Propo"
        pixelSize: 16
      }

      color: root.muted ? Colors.muted : Colors.vol
    }

    Text {
      text: root.icon
      font {
        family: "JetBrainsMono Nerd Font Propo"
        pixelSize: 16
      }

      color: root.muted ? Colors.muted : Colors.vol
    }

    Text {
      text: {
        if (!root.ready) return ""
        if (root.muted) return ""
        return root.vol + "%"
      }
    
      font {
        family: "FiraSans"
        pixelSize: 16
        weight: 700
      }

      color: root.muted ? Colors.muted : Colors.vol
    }

    PwObjectTracker {
      objects: [root.sink, root.source]
    }
  }
}
