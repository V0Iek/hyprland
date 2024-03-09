export default () =>
  Widget.Box({
    hpack: "end",
    class_name: "powerbuttons",
    children: [
      Widget.Button({
        child: Widget.Icon("system-log-out-symbolic"),
        on_primary_click: () => App.ToggleWindow("logout-popup"),
      }),
      Widget.Button({
        child: Widget.Icon("system-reboot-symbolic"),
        on_primary_click: () => App.ToggleWindow("reboot-popup"),
      }),
      Widget.Button({
        child: Widget.Icon("system-shutdown-symbolic"),
        on_primary_click: () => App.ToggleWindow("shutdown-popup"),
      }),
    ],
  });
