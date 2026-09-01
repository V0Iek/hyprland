import Quickshell
import QtQuick
import QtQuick.Layouts

Scope {
  id: root

  required property bool show
  required property var notifications

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
        id: centerCol

        anchors.fill: parent
        anchors.margins: 10

        spacing: 10

        RowLayout {
          Layout.fillWidth: true

          anchors.top: parent.top

          Text {
            Layout.fillWidth: true

            text: "Notifications"

            font {
              family: "FiraSans"
              pixelSize: 20
              bold: true
            }

            color: Colors.text
          }

          Rectangle {
            implicitWidth: clear.width + 20
            implicitHeight: 20

            radius: height / 2

            color: Colors.bg

            Text {
              id: clear

              anchors.centerIn: parent

              text: "Clear All"
              
              font {
                family: "FiraSans"
                pixelSize: 16
              }

              color: Colors.text
            }

            MouseArea {
              anchors.fill: parent
              cursorShape: Qt.PointingHandCursor
              onClicked: {
                var notifs = root.notifications
                for (var i = notifs.length - 1; i >= 0; i--) root.notifs[i].dismiss()
              }
            }
          }
        }

        ListView {
          Layout.fillWidth: true
          Layout.fillHeight: true

          spacing: 10

          model: root.notifications

          delegate: Card { timer: false }
        }
      }
    }
  }
}
