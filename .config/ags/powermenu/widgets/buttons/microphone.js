const { microphone } = await Service.import("audio");

const icon = () =>
  microphone.is_muted || microphone.stream?.is_muted
    ? Widget.Icon("microphone-sensitivity-muted-symbolic")
    : Widget.Icon("microphone-sensitivity-high-symbolic");

const label = () =>
  microphone.is_muted || microphone.stream?.is_muted
    ? Widget.Label("Muted")
    : Widget.Label("Unmuted");

export function MicMute() {
  const box = Widget.Box({
    class_name: "microphone",
    children: [icon(), label()],
  });

  if (microphone.is_muted || microphone.stream?.is_muted) {
    box.toggleClassName("unmuted", false);
  } else {
    box.toggleClassName("unmuted", true);
  }

  return box;
}
