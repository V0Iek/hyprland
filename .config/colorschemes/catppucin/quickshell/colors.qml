pragma Singleton

import QtQuick

QtObject {
  readonly property color bg: "#1e1e2e"
  readonly property color text: "#cdd6f4" 

  // App Menu
  readonly property color appMenu: "#74c7ec"

  // Workspaces
  readonly property color wsActiveBg: "#cba6f7"
  readonly property color wsInactiveBg: "#45475a"

  // Volume
  readonly property color vol: "#fab387"
  readonly property color muted: "#f38ba8"

  // Network
  readonly property color network: "#cba6f7"

  // Battery
  readonly property color bat3: "#a6e3a1"
  readonly property color bat2: "#f9e2af"
  readonly property color bat1: "#fab387"
  readonly property color bat0: "#f38ba8"
}
