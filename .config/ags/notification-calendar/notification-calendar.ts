const notificationSection = () =>
  Widget.Box({
    class_name: "notification-section",
    vertical: true,
    children: [
      Widget.Box({
        class_name: "notification-header",
        homogeneous: true,
        children: [
          Widget.Label({
            hpack: "start",
            label: "Notifications",
          }),
          Widget.Button({
            hpack: "end",
            on_primary_click: () => print("Clear notifications"),
            child: Widget.Box([
              Widget.Label("Clear"),
              Widget.Icon("edit-delete-symbolic"),
            ]),
          }),
        ],
      }),
    ],
  });

const date = Variable("", {
  poll: [1000, 'date "+%H:%M"'],
});

const uptime = Variable(0, {
  poll: [
    60_000,
    "cat /proc/uptime",
    (line) => Number.parseInt(line.split(".")[0]) / 60,
  ],
});

function up(up: number) {
  const h = Math.floor(up / 60);
  const m = Math.floor(up % 60);
  return `Uptime: ${h}:${m < 10 ? "0" + m : m}`;
}

const calendarSection = () =>
  Widget.Box({
    class_name: "calendar-section",
    vertical: true,
    children: [
      Widget.Box({
        vertical: true,
        children: [
          Widget.Label({
            class_name: "calendar-clock",
            label: date.bind(),
          }),
          Widget.Label({
            class_name: "calendar-uptime",
            label: uptime.bind().as(up),
          }),
        ],
      }),
      Widget.Calendar({}),
    ],
  });

export default () =>
  Widget.Window({
    name: "notification-calendar",
    class_name: "notification-calendar",
    visible: false,
    anchor: ["top"],
    margins: [10, 0],
    child: Widget.Box({
      children: [
        notificationSection(),
        Widget.Box({ class_name: "separator" }),
        calendarSection(),
      ],
    }),
  });
