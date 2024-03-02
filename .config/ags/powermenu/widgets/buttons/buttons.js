import { NetworkIndicator } from "./network.js";
import { MicMute } from "./microphone.js";

export const Buttons = () =>
  Widget.Box({
    class_name: "buttons",
    vertical: true,
    children: [
      Widget.Box({
        hexpand: true,
        homogeneous: true,
        children: [NetworkIndicator(), MicMute()]
      })
    ],
  });
