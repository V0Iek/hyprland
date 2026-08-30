import Quickshell
import QtQuick
import QtQuick.Layouts

Scope {
  id: root

  required property bool show

  PanelWindow {
    visible: root.show

    anchors { top: true; right: true; bottom: true }
    margins { top: 70; right: 20; bottom: 20 }

    implicitWidth: 380

    color: "transparent"

    exclusionMode: ExclusionMode.Ignore

    Rectangle {
      anchors.fill: parent

      radius: 15

      color: Colors.wsInactiveBg

      ColumnLayout {
        id: column

        width: parent.width

        spacing: 10

        Repeater {
          model: server.trackedNotifications

          delegate: Card { timer: false }
        }
      }
    }
  }
}
