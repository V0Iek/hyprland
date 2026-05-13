--     _         _            _             _
--    / \  _   _| |_ ___  ___| |_ __ _ _ __| |_
--   / _ \| | | | __/ _ \/ __| __/ _` | '__| __|
--  / ___ \ |_| | || (_) \__ \ || (_| | |  | |_
-- /_/   \_\__,_|\__\___/|___/\__\__,_|_|   \__|
--
------------------------------------------------

hl.on("hyprland.start", function ()
  --
  hl.exec_cmd("~/.config/hypr/scripts/xdg.sh")
  hl.exec_cmd("/usr/lib/polkit-kde-authentication-agent-1")
  hl.exec_cmd("xwaylandvideobridge")
  
  -- Udiskie
  hl.exec_cmd("udiskie")
 
  -- Hypridle
  hl.exec_cmd("hypridle")
  
  -- Theming
  hl.exec_cmd("~/.config/scripts/gtkthemes.sh")
  hl.exec_cmd("awww-daemon")
  hl.exec_cmd("~/.config/scripts/random-theme.sh")

  -- 
  hl.exec_cmd("waybar")
  hl.exec_cmd("swaync")
  hl.exec_cmd("kdeconnect-indicator")

  -- Clipboard Manager
  hl.exec_once("wl-paste --type text --watch cliphist store")   -- Stores only text data
  hl.exec_once("wl-paste --type image --watch cliphist store")  -- Stores only image data

  -- Apps
  hl.exec_cmd("openrgb --startminimized")
  hl.exec_cmd("flatpak run com.spotify.Client")
  hl.exec_cmd("flatpak run dev.vencord.Vesktop")
end)
