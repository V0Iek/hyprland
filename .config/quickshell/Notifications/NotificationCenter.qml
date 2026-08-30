import Quickshell
import Quickshell.Widgets
import Quickshell.Services.Notifications
import Quickshell.Io
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Scope {
  id: root
  property bool isOpen: false

  IpcHandler {
    target: "notify-center"

    function toggle(): void { root.isOpen = !root.isOpen }
    function open(): void { root.isOpen = true }
    function close(): void { root.isOpen = false }
  }

  NotificationServer {
    id: notifyServer

    onNotification: function(n) {
      n.tracked = true;
    }
  }

  PanelWindow {
    id: notifiactionCenter

    visible: root.isOpen

    anchors {
      top: true
      right: true
      bottom:true
      left: true
    }

    exclusiveZone: 0

    color: "transparent"

    MouseArea {
      anchors.fill: parent
      onClicked: { root.isOpen = false }
    }

    Rectangle {
      implicitWidth: 400

      anchors {
        top: parent.top
        right: parent.right
        bottom: parent.bottom
        topMargin: 20
        rightMargin: 20
        bottomMargin: 20
      }

      color: Colors.bg

      radius: 15

      ColumnLayout {
        anchors.fill: parent
        spacing: 10
        anchors.margins: 10

        RowLayout {
          Layout.fillWidth: true

          Text {
            text: "Notifications"
            
            font {
              family: "FiraSans"
              pixelSize: 16
              weight: 700
            }

            color: Colors.text
          }

          Item { Layout.fillWidth: true }

          Rectangle {
            implicitWidth: clear_text.implicitWidth + 20
            implicitHeight: parent.implicitHeight 

            color: Colors.wsInactiveBg

            radius: height / 2

            Text {
              id: clear_text

              anchors.centerIn: parent

              text: "Clear"

              font {
                family: "FiraSans"
                pixelSize: 16
                weight: 700
              }

              color: Colors.text
            }

            MouseArea {
              anchors.fill: parent
              cursorShape: Qt.PointingHandCursor
              onClicked: {
                var notifs = notifyServer.trackedNotifications.values;
                for (var i = notifs.length - 1; i >= 0; i--) notifs[i].dismiss()
              }
            }
          }
        }

        ListView {
          Layout.fillWidth: true
          Layout.fillHeight: true
          spacing: 8

          model: notifyServer.trackedNotifications.values

          delegate: Rectangle {
            required property var modelData

            implicitWidth: ListView.view.width
            implicitHeight: 100

            radius: 15

            color: "#22232a"

            RowLayout {
              anchors {
                fill: parent
                topMargin: 20
                leftMargin: 20
                bottomMargin: 20
                rightMargin: 20
              }

              Image {
                Layout.preferredWidth: 60
                Layout.preferredHeight: 60
                fillMode: Image.PreserveAspectFit

                source: {
                  if (modelData.image) return modelData.image
                  if (modelData.appIcon) return Quickshell.iconPath(modelData.appIcon)
                  return "dialog-information-symbolic"
                }
              }

              ColumnLayout {
                RowLayout {
                  Text {
                    text: modelData.summary

                    elide: Text.ElideRight

                    Layout.maximumWidth: 200

                    font {
                      family: "FiraSans"
                      pixelSize: 24
                      weight: 800
                    }
            
                    color: "#d4d7d9"
                  }

                  Item { Layout.fillWidth: true }

                  Rectangle {
                    id: closeButton

                    implicitWidth: 24
                    implicitHeight: 24

                    radius: height / 2

                    color: "#2e303e"
                
                    Text {
                      anchors.centerIn: parent

                      text: String.fromCodePoint(0xf00d)
                  
                      font {
                        family: "JetBrains Mono Nerd Font Propo"
                        pixelSize: 16
                      }

                      color: "#d4d7d9"
                    }

                    MouseArea {
                      anchors.fill: parent
                      cursorShape: Qt.PointingHandCursor
                      onClicked: function() {
                        modelData.dismiss();
                      }
                    }
                  }
                }

                Text {
                  text: modelData.body

                  elide: Text.ElideRight
                  wrapMode: Text.WordWrap

                  Layout.maximumWidth: 250

                  font {
                    family: "FiraSans"
                    pixelSize: 12
                    weight: 700
                  }
            
                  color: "#d4d7d9"
                }
              }
            }
          }
        }
      }
    }
  }
}
