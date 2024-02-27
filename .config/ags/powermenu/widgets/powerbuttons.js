export default () =>
  Widget.Box({
    hpack: "end",
    class_name: "powerbuttons",
    children: [
      Widget.Button({
        child: Widget.Icon("system-log-out-symbolic"),
        on_primary_click: () =>
          Utils.execAsync("ags -t logout-popup"),
      }),
      Widget.Button({
        child: Widget.Icon("system-reboot-symbolic"),
        on_primary_click: () => Utils.execAsync("ags -t reboot-popup"),
      }),
      Widget.Button({
        child: Widget.Icon("system-shutdown-symbolic"),
        on_primary_click: () => Utils.execAsync("ags -t shutdown-popup"),
      }),
    ],
  });
