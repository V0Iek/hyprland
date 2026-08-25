import Quickshell
import QtQuick
import QtQuick.Layouts

ShellRoot {
  PanelWindow {
    anchors {
      top: true
      left: true
      right: true
    }

    margins { top: 10; left: 20; bottom: 0; right: 20 }

    implicitHeight: 40

    color: "transparent"

    RowLayout {
      anchors.fill: parent
      spacing: 16

      AppMenu {}
      WindowTitle {}

      Item { Layout.fillWidth: true }

      Workspaces { anchors.centerIn: parent }

      Item { Layout.fillWidth: true }

      SystemTray {}
      Volume {}
      Network {}
      Battery {}
      Clock {}
    }
  }
}
