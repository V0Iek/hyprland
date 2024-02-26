const audio = await Service.import("audio");

export const Volume = () =>
  Widget.Box({
    class_name: "volume",
    children: [
      Widget.Icon().hook(audio.speaker, (self) => {
        const category = {
          101: "overamplified",
          67: "high",
          34: "medium",
          1: "low",
          0: "muted",
        };

        const icon = audio.speaker.is_muted
          ? 0
          : [101, 67, 34, 1, 0].find(
            (threshold) => threshold <= audio.speaker.volume * 100,
          );

        self.icon = `audio-volume-${category[icon]}-symbolic`;
      }),
      Widget.Label({ label: audio.speaker.volume * 100 }),
      Widget.Slider({
        hexpand: true,
        draw_value: false,
        on_change: ({ value }) => (audio.speaker.volume = value),
        setup: (self) =>
          self.hook(audio.speaker, () => {
            self.value = audio.speaker.volume || 0;
          }),
      }),
    ],
  });
