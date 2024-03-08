const date = Variable("", {
  poll: [1000, 'date "+%e %b %H:%M"'],
});

export const Clock = () =>
  Widget.Label({
    class_name: "clock",
    hpack: "center",
    label: date.bind(),
  });
