// __     __         _       _     _
// \ \   / /_ _ _ __(_) __ _| |__ | | ___  ___
//  \ \ / / _` | '__| |/ _` | '_ \| |/ _ \/ __|
//   \ V / (_| | |  | | (_| | |_) | |  __/\__ \
//    \_/ \__,_|_|  |_|\__,_|_.__/|_|\___||___/
//
// --------------------------------------------

const hyprland = await Service.import("hyprland");
const notifications = await Service.import("notifications");
const mpris = await Service.import("mpris");
const audio = await Service.import("audio");
const network = await Service.import("network");
const battery = await Service.import("battery");
const systemtray = await Service.import("systemtray");

const date = Variable("", {
  poll: [1000, 'date "+%e %b %H:%M"'],
});

// __        ___     _            _
// \ \      / (_) __| | __ _  ___| |_ ___
//  \ \ /\ / /| |/ _` |/ _` |/ _ \ __/ __|
//   \ V  V / | | (_| | (_| |  __/ |_\__ \
//    \_/\_/  |_|\__,_|\__, |\___|\__|___/
//                     |___/
//
// ---------------------------------------

//  _          __ _
// | |    ___ / _| |_
// | |   / _ \ |_| __|
// | |__|  __/  _| |_
// |_____\___|_|  \__|
//
// -------------------

// -------------------
// Window title
// -------------------
export const ClientTitle = () =>
  Widget.Label({
    class_name: "client-title",
    label: hyprland.active.client.bind("title"),
  });

//   ____           _
//  / ___|___ _ __ | |_ ___ _ __
// | |   / _ \ '_ \| __/ _ \ '__|
// | |__|  __/ | | | ||  __/ |
//  \____\___|_| |_|\__\___|_|
//
// ------------------------------

// ------------------------------
// Workspaces
// ------------------------------
export function Workspaces() {
  const workspaces = hyprland.bind("workspaces");
  const activeId = hyprland.active.workspace.bind("id");
  return Widget.Box({
    class_name: "workspaces",
    children: workspaces.as((ws) =>
      ws.map(({ id }) =>
        Widget.Button({
          on_clicked: () => hyprland.messageAsync(`dispatch workspace ${id}`),
          child: Widget.Label(`${id}`),
          class_name: activeId.as((i) => `${i === id ? "focused" : ""}`),
        }),
      ),
    ),
  });
}

// ------------------------------
// Notifications
// ------------------------------
export function Notification() {
  const popups = notifications.bind("popups");
  return Widget.Box({
    class_name: "notification",
    visible: popups.as((p) => p.length > 0),
    children: [
      Widget.Icon({
        icon: "preferences-system-notifications-symbolic",
      }),
      Widget.Label({
        label: popups.as((p) => p[0]?.summary || ""),
      }),
    ],
  });
}

//  ____  _       _     _
// |  _ \(_) __ _| |__ | |_
// | |_) | |/ _` | '_ \| __|
// |  _ <| | (_| | | | | |_
// |_| \_\_|\__, |_| |_|\__|
//          |___/
//
// -------------------------

// ------------------------------
// Media
// ------------------------------
export const Media = () =>
  Widget.Button({
    class_name: "media",
    on_primary_click: () => mpris.getPlayer("")?.playPause(),
    on_scroll_up: () => mpris.getPlayer("")?.next(),
    on_scroll_down: () => mpris.getPlayer("")?.previous(),
    child: Widget.Label("-").hook(
      mpris,
      (self) => {
        if (mpris.players[0]) {
          const { track_artists, track_title } = mpris.players[0];
          self.label = `${track_artists.join(", ")} - ${track_title}`;
        } else {
          self.label = "Nothing is playing";
        }
      },
      "player-changed",
    ),
  });

// -------------------------
// Volume
// -------------------------
export const Volume = () =>
  Widget.Box({
    class_name: "volume",
    css: "min-width: 180px",
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
      Widget.Label({
        label: audio.speaker.volume * 100,
      }),
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

// -------------------------
// Network
// -------------------------
const WifiIndicator = () =>
  Widget.Box({
    class_name: "network",
    children: [
      Widget.Icon({
        icon: network.wifi.bind("icon_name"),
      }),
      Widget.Label({
        label: network.wifi.bind("ssid").as((ssid) => ssid || "Unknown"),
      }),
    ],
  });

const WiredIndicator = () =>
  Widget.Icon({
    class_name: "network",
    icon: network.wired.bind("icon_name"),
  });

export const NetworkIndicator = () =>
  Widget.Stack({
    items: [
      ["wifi", WifiIndicator()],
      ["wired", WiredIndicator()],
    ],
    shown: network.bind("primary").as((p) => p || "wifi"),
  });

// -------------------------
// System tray
// -------------------------
export const SysTray = () =>
  Widget.Box({
    children: systemtray.bind("items").as((items) =>
      items.map((item) =>
        Widget.Button({
          child: Widget.Icon({ icon: item.bind("icon") }),
          on_primary_click: (_, event) => item.activate(event),
          on_secondary_click: (_, event) => item.openMenu(event),
          tooltip_markup: item.bind("tooltip_markup"),
        }),
      ),
    ),
  });

// -------------------------
// Clock
// -------------------------
export const Clock = () =>
  Widget.Label({
    class_name: "clock",
    label: date.bind(),
  });

// -------------------------
// Battery
// -------------------------
export const BatteryLabel = () =>
  Widget.Box({
    class_name: "battery",
    visible: battery.bind("available"),
    children: [
      Widget.Icon({
        icon: battery
          .bind("percent")
          .as((p) => `battery-level-${Math.floor(p / 10) * 10}-symbolic`),
      }),
      Widget.ProgressBar({
        vpack: "center",
        fraction: battery.bind("percent").as((p) => (p > 0 ? p / 100 : 0)),
      }),
    ],
  });
