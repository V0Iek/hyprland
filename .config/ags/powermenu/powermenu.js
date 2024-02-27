import PowerButtons from "./widgets/powerbuttons.js";
import { Sliders } from "./widgets/sliders.js";
import { Buttons } from "./widgets/buttons/buttons.js";
import Media from "./widgets/media.js";

export const PowerMenu = () =>
  Widget.Window({
    name: "PowerMenu",
    class_name: "powermenu",
    anchor: ["top", "right"],
    visible: false,
    margins: [10, 10],
    child: Widget.Box({
      class_name: "powermenu-box",
      vertical: true,
      children: [
        Widget.CenterBox({
          start_widget: Widget.Label({
            class_name: "greet",
            hpack: "start",
            label: Utils.exec(`bash -c "echo Hello, $USER!"`),
          }),
          end_widget: PowerButtons(),
        }),
        Sliders(),
        Buttons(),
        Media(),
      ],
    }),
  });
