const updates = Utils.exec('bash -c "checkupdates | wc -l"');

export const UpdateIndicator = () =>
  Widget.Label({
    class_name: "updates",
    label: `  ${updates}`,
  });
