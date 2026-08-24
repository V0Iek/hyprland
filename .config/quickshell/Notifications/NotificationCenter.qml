import Quickshell
import Quickshell.Widgets
import Quickshell.Services.Notifications
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Scope {
  id: root

  NotificationServer {
    id: notifyServer

    onNotification: function(n) {
      n.tracked = true;
    }
  }

  LazyLoader {
    active: false

    PanelWindow {
      id: notifiactionCenter

      anchors {
        top: true
        right: true
        bottom:true
      }

      exclusiveZone: 0
    }
  }
}
