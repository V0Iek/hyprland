import { ClientTitle } from "./widgets/window-title.js";
import { Workspaces } from "./widgets/workspaces.js";
import Media from "./widgets/media.ts";
import { UpdateIndicator } from "./widgets/system-updates.js";
import { SysTray } from "./widgets/tray.js";
import { Clock } from "./widgets/clock.js";
import { PowerMenu } from "./widgets/power-menu.js";

//  _                            _
// | |    __ _ _   _  ___  _   _| |_
// | |   / _` | | | |/ _ \| | | | __|
// | |__| (_| | |_| | (_) | |_| | |_
// |_____\__,_|\__, |\___/ \__,_|\__|
//             |___/
//
// ----------------------------------

export const MainLeft = () =>
  Widget.Box({
    spacing: 8,
    children: [
      Workspaces(),
      ClientTitle()
    ],
  });

export const MainCenter = () =>
  Widget.Box({
    spacing: 8,
    children: [
      UpdateIndicator(),
      Clock(),
      Media(),
    ],
  });

export const MainRight = () =>
  Widget.Box({
    hpack: "end",
    spacing: 8,
    children: [
      SysTray(),
      PowerMenu(),
    ],
  });
