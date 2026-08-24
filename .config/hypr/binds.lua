--  ____  _           _
-- | __ )(_)_ __   __| |___
-- |  _ \| | '_ \ / _` / __|
-- | |_) | | | | | (_| \__ \
-- |____/|_|_| |_|\__,_|___/
--
----------------------------

local mainMod = "SUPER" -- Sets "Windows" key as main modifier

local terminal    = "kitty"
local fileManager = "nautilus"
local menu        = "rofi -show drun"

-----------------
---- General ----
-----------------
hl.bind(mainMod .. " + return",     hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Q",          hl.dsp.window.close())
hl.bind(mainMod .. " + SHIFT + Q",  hl.dsp.exec_cmd("~/.config/rofi/applets/powermenu.sh"))
hl.bind(mainMod .. " + L",          hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod .. " + F",          hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + space",      hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + P",          hl.dsp.window.pseudo())
hl.bind(mainMod .. " + B",          hl.dsp.exec_cmd("flatpak run app.zen_browser.zen"))

----------------
---- Layout ----
----------------
hl.bind(mainMod .. " + V",      hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + J",      hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. " + period", function()
  if hl.get_config("general.layout") == "dwindle" then
    hl.config({ general = { layout = "scrolling" } })
  else
    hl.config({ general = { layout = "dwindle" } })
  end
end)

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

-------------------
---- Apperance ----
-------------------
hl.bind(mainMod .. " + T",  hl.dsp.exec_cmd("~/.config/colorschemes/themeswitcher.sh"))
hl.bind(mainMod .. " + C",  hl.dsp.exec_cmd("~/.config/waybar-themes/layoutswitcher.sh"))
hl.bind(mainMod .. " + W",  hl.dsp.exec_cmd("~/.config/scripts/theme-switcher-gui.sh"))

------------------
---- Gamemode ----
------------------
hl.bind(mainMod .. " + G", function()
  if hl.get_config("animations.enabled") == true then
    hl.config({ animations = { enabled = false } })
    hl.config({ decoration = {
      shadow            = { enabled = false },
      blur              = { enabled = false },
      rounding          = false,
      inactive_opacity  = 1,
    } })
    hl.config({ general = {
      gaps_in     = 0,
      gaps_out    = 0,
      border_size = 1,
    } })
  else
    hl.exec_cmd("hyprctl reload")
  end
end)

--------------------
---- Workspacec ----
--------------------
-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,          hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key,  hl.dsp.window.move({ workspace = i }))
end

-- Special workspace (scratchpad)
hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

---------------
---- Media ----
---------------
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

hl.bind(mainMod .. " + A",          hl.dsp.exec_cmd("~/.config/rofi/applets/audiooutputswitcher.sh"))
hl.bind(mainMod .. " + SHIFT + M",  hl.dsp.exec_cmd("~/.config/scripts/toggle-source-mute.sh"))

--------------------
---- Calculator ----
--------------------
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.exec_cmd("~/.config/rofi/applets/calculator.sh"))

---------------------
---- Screenshots ----
---------------------
hl.bind("print",            hl.dsp.exec_cmd("~/.config/rofi/applets/screenshot.sh"))
hl.bind(mainMod .. " + M",  hl.dsp.exec_cmd("wl-paste | satty -f -"))
