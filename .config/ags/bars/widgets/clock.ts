const date = Variable("", {
  poll: [1000, 'date "+%e %b %H:%M"'],
});

export default () =>
  Widget.Button({
    class_name: "clock",
    hpack: "center",
    child: Widget.Label({
      label: date.bind(),
    }),
    on_primary_click: () => App.ToggleWindow("notification-calendar"),
  });
