import { ClientTitle, Workspaces, Clock } from "./widgets.js";

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
    children: [ClientTitle()],
  });

export const SecondCenter = () =>
  Widget.Box({
    spacing: 8,
    children: [Workspaces()],
  });

export const SecondRight = () =>
  Widget.Box({
    hpack: "end",
    spacing: 8,
    children: [Clock()],
  });
