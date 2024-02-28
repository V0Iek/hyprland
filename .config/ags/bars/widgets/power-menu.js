import { Volume } from "./volume.js";
import { NetworkIndicator } from "./network.js";

export const PowerMenu = () =>
  Widget.Button({
    class_name: "powermenu_button",
    on_primary_click: () => Utils.execAsync("ags -t PowerMenu"),
    child: Widget.Box({
      children: [
        Volume(),
        NetworkIndicator(),
        Widget.Icon("system-shutdown-symbolic")
      ],
    }),
  });
