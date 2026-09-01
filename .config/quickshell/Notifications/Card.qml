import Quickshell
import Quickshell.Services.Notifications
import QtQuick
import QtQuick.Layouts

Rectangle {
  id: card

  required property var modelData
  required property bool timer

  Timer {
    running: timer
    interval: 5000
    onTriggered: card.visible = false
  }

  visible: true

  Layout.fillWidth: true
  implicitHeight: layout.implicitHeight + 20

  color: Colors.bg

  radius: 15

  RowLayout {
    id: layout

    anchors.fill: parent
    anchors.margins: 10
    spacing: 10

    Image {
      Layout.preferredWidth: 36
      Layout.preferredHeight: 36
      Layout.alignment: Qt.AlignTop
      fillMode: Image.PreserveAspectFit

      visible: source.toString() !== ""

      source: card.modelData.image || card.modelData.appIcon || ""
    }

    ColumnLayout {
      Layout.fillWidth: true

      spacing: 2

      Text {
        Layout.fillWidth: true

        text: card.modelData.summary
 
        elide: Text.ElideRight

        font {
          family: "FiraSans"
          pixelSize: 16
          bold: true
        }

        color: Colors.text
      }

      Text {
        Layout.fillWidth: true

        visible: text !== ""

        text: card.modelData.body
 
        wrapMode: Text.WordWrap

        font {
          family: "FiraSans"
          pixelSize: 16
        }

        color: Colors.text
      }
    }
  }

  MouseArea {
    anchors.fill: parent

    onClicked: card.modelData.dismiss()
  }
}
