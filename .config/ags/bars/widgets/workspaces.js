const hyprland = await Service.import("hyprland");

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
