-- __        ___           _                            _
-- \ \      / (_)_ __   __| | _____      __  _ __ _   _| | ___  ___
--  \ \ /\ / /| | '_ \ / _` |/ _ \ \ /\ / / | '__| | | | |/ _ \/ __|
--   \ V  V / | | | | | (_| | (_) \ V  V /  | |  | |_| | |  __/\__ \
--    \_/\_/  |_|_| |_|\__,_|\___/ \_/\_/   |_|   \__,_|_|\___||___/
--
--------------------------------------------------------------------

hl.window_rule({
  name =              "xwayland-video-bridge-fixes",
  match =             { class = "xwaylandvideobridge" },

  no_initial_focus =  true,
  no_focus =          true,
  no_anim =           true,
  no_blur =           true,
  max_size =          { 1, 1 },
  opacity =           0.0,
})

hl.window_rule({ match = { class = "Spotify" },                                   workspace = "magic", no_initial_focus = true })
hl.window_rule({ match = { class = "vesktop" },                                   workspace = "magic", no_initial_focus = true })
hl.window_rule({ match = { class = "org.kde.polkit-kde-authentication-agent-1" }, float = true })
hl.window_rule({ match = { class = "org.gnome.FileRoller" },                      float = true })
hl.window_rule({ match = { class = "file-roller" },                               float = true })
hl.window_rule({ match = { class = "com.gabm.satty" },                            float = true })
hl.window_rule({ match = { class = "steam" },                                     float = true })
hl.window_rule({ match = { title = "Steam" },                                     tile = true })
hl.window_rule({ match = { class = "^(steam_app)(.*)" },                          fullscreen = true })
