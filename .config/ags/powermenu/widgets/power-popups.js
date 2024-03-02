export const ShutdownPopup = () =>
  Widget.Window({
    name: "shutdown-popup",
    visible: false,
    class_name: "power-popup",
    child: Widget.Box({
      class_name: "power-popup-box",
      vertical: true,
      children: [
        Widget.Label({
          hpack: "center",
          label: "Are you sure you want to shutdown?",
        }),
        Widget.Box({
          homogeneous: true,
          children: [
            Widget.Button({
              child: Widget.Label("  Cancel  "),
              on_primary_click: () => Utils.execAsync("ags -t shutdown-popup"),
            }),
            Widget.Button({
              child: Widget.Label("Shutdown"),
              on_primary_click: () => Utils.execAsync("systemctl poweroff"),
            }),
          ],
        }),
      ],
    }),
  });

export const RebootPopup = () =>
  Widget.Window({
    name: "reboot-popup",
    visible: false,
    class_name: "power-popup",
    child: Widget.Box({
      class_name: "power-popup-box",
      vertical: true,
      children: [
        Widget.Label({
          hpack: "center",
          label: "Are you sure you want to reboot?",
        }),
        Widget.Box({
          homogeneous: true,
          children: [
            Widget.Button({
              child: Widget.Label("Cancel"),
              on_primary_click: () => Utils.execAsync("ags -t reboot-popup"),
            }),
            Widget.Button({
              child: Widget.Label("Reboot"),
              on_primary_click: () => Utils.execAsync("systemctl reboot"),
            }),
          ],
        }),
      ],
    }),
  });

export const LogoutPopup = () =>
  Widget.Window({
    name: "logout-popup",
    visible: false,
    class_name: "power-popup",
    child: Widget.Box({
      class_name: "power-popup-box",
      vertical: true,
      children: [
        Widget.Label({
          hpack: "center",
          label: "Are you sure you want to logout?",
        }),
        Widget.Box({
          homogeneous: true,
          children: [
            Widget.Button({
              child: Widget.Label("Cancel"),
              on_primary_click: () => Utils.execAsync("ags -t logout-popup"),
            }),
            Widget.Button({
              child: Widget.Label("Logout"),
              on_primary_click: () =>
                Utils.execAsync(`bash -c "loginctl terminate-user $USER"`),
            }),
          ],
        }),
      ],
    }),
  });
