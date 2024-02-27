import { NetworkIndicator } from "./network.js";

export const Buttons = () =>
  Widget.Box({
    class_name: "buttons",
    vertical: true,
    children: [NetworkIndicator()],
  });
