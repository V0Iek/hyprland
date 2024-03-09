import MicIndicator from "./mic-indicator.ts";
import { Volume } from "./volume.js";
import { NetworkIndicator } from "./network.js";

export const PowerMenu = () =>
  Widget.Button({
    class_name: "powermenu_button",
    on_clicked: () => App.ToggleWindow("PowerMenu"),
    child: Widget.Box({
      children: [
        MicIndicator(),
        Volume(),
        NetworkIndicator(),
        Widget.Icon("system-shutdown-symbolic"),
      ],
    }),
  });
