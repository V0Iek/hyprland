const mpris = await Service.import("mpris");

export const Media = () =>
  Widget.Button({
    class_name: "media",
    on_clicked: () => Utils.execAsync("ags -t media"),
    child: Widget.Box({
      children: [
        Widget.Label("-").hook(
          mpris,
          (self) => {
            if (mpris.players[0]) {
              const { track_title } = mpris.players[0];
              self.label = track_title;
            } else {
              self.label = "Nothing is playing";
            }
          },
          "player-changed",
        ),
      ],
    }),
  });
