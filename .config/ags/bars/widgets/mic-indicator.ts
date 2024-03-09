const { microphone } = await Service.import("audio");

export default () =>
  microphone.is_muted || microphone.stream?.is_muted
    ? Widget.Icon("microphone-sensitivity-muted-symbolic")
    : Widget.Icon("microphone-sensitivity-high-symbolic");
