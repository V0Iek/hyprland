const network = await Service.import("network");

const WifiIndicator = () =>
  Widget.Box({
    class_name: "network",
    children: [
      Widget.Icon({
        icon: network.wifi.bind("icon-name"),
      }),
      Widget.Label({
        label: network.wifi.bind("ssid").as((ssid) => ssid || "Unknown"),
      }),
    ],
  });

const WiredIndicator = () =>
  Widget.Box({
    class_name: "network",
    children: [
      Widget.Icon({
        icon: network.wired.bind("icon-name"),
      }),
      Widget.Label("Wired"),
    ],
  });

export const NetworkIndicator = () =>
  Widget.Stack({
    children: {
      wifi: WifiIndicator(),
      wired: WiredIndicator(),
    },
    shown: network.bind("primary").as((p) => p || "wifi"),
  });
