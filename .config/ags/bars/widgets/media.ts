const mpris = await Service.import("mpris");
const players = mpris.bind("players");

const FALLBACK_ICON = "audio-x-generic-symbolic";

const getPlayer = (name = null) =>
  mpris.getPlayer(name) || mpris.players[0] || null;

const Media = (player) => {
  const icon = Widget.Icon({
    tooltip_text: player.identity || "",
    icon: player.bind("entry").transform((entry) => {
      const name = `${entry}`;
      return Utils.lookUpIcon(name) ? name : FALLBACK_ICON;
    }),
  });

  return Widget.Box({ children: [icon] });
};

export default () => {
  let player = getPlayer();

  const btn = Widget.Button({
    class_name: "media",
    on_clicked: () => Utils.execAsync("ags -t media"),
  });

  const update = () => {
    player = getPlayer();
    btn.child = Media(player);
  };

  return btn.hook(update).hook(mpris, update, "notify::players");
};
