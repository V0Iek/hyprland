import Quickshell
import Quickshell.Widgets
import Quickshell.Services.Notifications
import QtQuick
import QtQuick.Layouts

Scope {
  id: root

  property bool shouldShowOsd: false
  property var notification: null

  NotificationServer {
    id: notifyServer

    actionsSupported: true
    bodySupported: true
    imageSupported: true

    onNotification: function(n) {
      root.notification = n

      root.shouldShowOsd = true;
      hideTimer.restart()
    }
  }

  Timer {
    id: hideTimer
    interval: 5000
    onTriggered: root.shouldShowOsd = false
  }

  LazyLoader {
    active: root.shouldShowOsd

    PanelWindow {
      anchors {
        top: true
        right: true
      }

      implicitWidth: 350
      implicitHeight: 100

      margins {
        top: 20
        right: 20
      }

      color: "transparent"

      Rectangle {
        anchors.fill: parent

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
              if (notification.image) return notification.image
              if (notification.appIcon) return Quickshell.iconPath(notification.appIcon)
              return "dialog-information-symbolic"
            }
          }

          ColumnLayout {
            RowLayout {
              Text {
                text: root.notification.summary

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
                    root.notification.dismiss();
                    root.shouldShowOsd = false;
                  }
                }
              }
            }

            Text {
              text: root.notification.body

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
