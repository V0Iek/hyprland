import { MainLeft, MainCenter, MainRight } from "./main-layout.js";

//  ____
// | __ )  __ _ _ __ ___
// |  _ \ / _` | '__/ __|
// | |_) | (_| | |  \__ \
// |____/ \__,_|_|  |___/
//
// ----------------------

const MainBar = (monitor = 0) =>
  Widget.Window({
    name: `bar-${monitor}`,
    class_name: "bar",
    monitor,
    anchor: ["top", "left", "right"],
    exclusivity: "exclusive",
    child: Widget.CenterBox({
      start_widget: MainLeft(),
      center_widget: MainCenter(),
      end_widget: MainRight(),
    }),
  });

import { SecondLeft, SecondCenter, SecondRight } from "./second-layout.js"

const SecondBar = (monitor = 1) =>
  Widget.Window({
    name: `bar-${monitor}`,
    class_name: "bar",
    monitor,
    anchor: ["top", "left", "right"],
    exclusivity: "exclusive",
    child: Widget.CenterBox({
      start_widget: SecondLeft(),
      center_widget: SecondCenter(),
      end_widget: SecondRight(),
    }),
  });

export default {
  style: "./style.css",
  windows: [MainBar()],
  windows: [SecondBar()],
};
