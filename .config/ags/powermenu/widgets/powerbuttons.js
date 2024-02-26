export default () =>
  Widget.Box({
    hpack: "end",
    class_name: "powerbuttons",
    children: [
      Widget.Button({
        child: Widget.Icon("system-log-out-symbolic"),
        on_primary_click: () =>
          Utils.exec(`bash -c "loginctl terminate-user $USER"`),
      }),
      Widget.Button({
        child: Widget.Icon("system-reboot-symbolic"),
        on_primary_click: () => Utils.exec("systemctl reboot"),
      }),
      Widget.Button({
        child: Widget.Icon("system-shutdown-symbolic"),
        on_primary_click: () => Utils.exec("systemctl poweroff"),
      }),
    ],
  });
