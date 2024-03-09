import { ClientTitle } from "./widgets/window-title.js";
import { Workspaces } from "./widgets/workspaces.js";
import Clock from "./widgets/clock.js";
import { PowerMenu } from "./widgets/power-menu.js";

//  _                            _
// | |    __ _ _   _  ___  _   _| |_
// | |   / _` | | | |/ _ \| | | | __|
// | |__| (_| | |_| | (_) | |_| | |_
// |_____\__,_|\__, |\___/ \__,_|\__|
//             |___/
//
// ----------------------------------

export const SecondLeft = () =>
  Widget.Box({
    spacing: 8,
    children: [Workspaces(), ClientTitle()],
  });

export const SecondCenter = () =>
  Widget.Box({
    spacing: 8,
    children: [Clock()],
  });

export const SecondRight = () =>
  Widget.Box({
    hpack: "end",
    spacing: 8,
    children: [PowerMenu()],
  });
