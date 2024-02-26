import Media from "./widgets/media/Media.js";

export const PowerMenu = () =>
  Widget.Window({
    name: "PowerMenu",
    anchor: ["top", "right"],
    visible: false,
    margins: [10, 10],
    child: Widget.Box({
      vertical: true,
      children: [
        Widget.Label({ label: "start" }),
        Widget.Label({ label: "center" }),
        Media(),
      ],
    }),
  });
