import {
  ClientTitle,
  Workspaces,
  Notification,
  Media,
  Volume,
  NetworkIndicator,
  UpdateIndicator,
  SysTray,
  Clock,
  BatteryLabel,
} from "./widgets.js";

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
    children: [ClientTitle()],
  });

export const MainCenter = () =>
  Widget.Box({
    spacing: 8,
    children: [Workspaces(), Notification()],
  });

export const MainRight = () =>
  Widget.Box({
    hpack: "end",
    spacing: 8,
    children: [Media(), Volume(), NetworkIndicator(), UpdateIndicator(), SysTray(), Clock(), BatteryLabel()],
  });
