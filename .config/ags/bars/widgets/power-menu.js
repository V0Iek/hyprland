export const PowerMenu = () =>
  Widget.Box({
    class_name: "powermenu_button",
    child: Widget.Button({
      child: Widget.Icon("system-shutdown-symbolic"),
      on_primary_click: () => Utils.execAsync("ags -t PowerMenu"),
    }),
  });
