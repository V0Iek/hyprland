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
  Widget.Icon({
    class_name: "network",
    icon: network.wired.bind("icon-name"),
  });

export const NetworkIndicator = () =>
  Widget.Stack({
    items: [
      //["wifi", WifiIndicator()],
      ["wired", WiredIndicator()],
    ],
    shown: network.bind("primary").as((p) => p || "wifi"),
  });
