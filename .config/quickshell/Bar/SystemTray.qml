import Quickshell
import Quickshell.Services.SystemTray
import QtQuick
import QtQuick.Layouts

RowLayout {
  spacing: 8

  Repeater {
    model: SystemTray.items

    delegate: Item {
      required property SystemTrayItem modelData

      implicitWidth: 20
      implicitHeight: 20

      Image {
        anchors.fill: parent

        source: parent.modelData.icon
        smooth: true
      }

      MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton | Qt.RigthButton

        onClicked: (mouse) => {
          if (mouse.button === Qt.LeftButton) parent.modelData.activate()
          else if (mouse.button === Qt.RightButton) {
            if (parent.modelData.hasMenu) parent.modelData.open(this)
          }
        }
      }
    }
  }  
}
