import Hyprland from "gi://AstalHyprland"

export default function Workspaces() {
    return (
        <box spacing={6}>
            {Hyprland.bind("workspaces").as(ws =>
                ws.map(w => (
                    <button
                        onClicked={() =>
                            Hyprland.messageAsync(`dispatch workspace ${w.id}`)
                        }
                        className={Hyprland.bind("activeWorkspace").as(a =>
                            a.id === w.id ? "active" : ""
                        )}
                    >
                        {w.id}
                    </button>
                ))
            )}
        </box>
    );
}
