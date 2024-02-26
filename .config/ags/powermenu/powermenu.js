import Media from "./widgets/media.js";
import PowerButtons from "./widgets/powerbuttons.js";

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
          start_widget: Widget.Label({ label: Utils.exec(`bash -c "echo Hello $USER"`) }),
          end_widget: PowerButtons(),
        }),
        Media(),
      ],
    }),
  });
