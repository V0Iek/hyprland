import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import Quickshell.Services.Notifications
import QtQuick
import QtQuick.Layouts

Scope {
  id: root

  property bool centerOpen: false

  NotificationServer {
    id: server

    actionsSupported: true
    bodySupported: true
    imageSupported: true

    onNotification: n => n.tracked = true
  }

  IpcHandler {
    target: "notifications"
    function toggle(): void { root.centerOpen = !root.centerOpen }
  }

  Center {
    show: root.centerOpen
    notifications: server.trackedNotifications
  }

  PanelWindow {
    anchors { top: true; right: true }
    margins { top: 70; right: 20 }

    implicitWidth: 380
    implicitHeight: Math.max(1, column.implicitHeight)

    color: "transparent"

    exclusionMode: ExclusionMode.Ignore

    ColumnLayout {
      id: column

      width: parent.width

      spacing: 10

      Repeater {
        model: server.trackedNotifications

        delegate: Card { timer: true }
      }
    }
  }
}
