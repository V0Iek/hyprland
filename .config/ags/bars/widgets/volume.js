const audio = await Service.import("audio");

export const Volume = () =>
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
  });
