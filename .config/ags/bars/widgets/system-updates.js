const updates = Variable("", {
  poll: [360000, 'bash -c "checkupdates | wc -l"'],
});

export const UpdateIndicator = () =>
  Widget.Label({
    class_name: "updates",
    label: updates.bind().as((u) => `  ${u}`),
  });
