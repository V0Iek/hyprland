--     _          _                 _   _
--    / \   _ __ (_)_ __ ___   __ _| |_(_) ___  _ __  ___
--   / _ \ | '_ \| | '_ ` _ \ / _` | __| |/ _ \| '_ \/ __|
--  / ___ \| | | | | | | | | | (_| | |_| | (_) | | | \__ \
-- /_/   \_\_| |_|_|_| |_| |_|\__,_|\__|_|\___/|_| |_|___/
--
----------------------------------------------------------

hl.curve("myBezier",  { type = "bezier", points = { {0.05, 0.9},    {0.1, 1.05} } })
hl.curve("bouncy",    { type = "bezier", points = { {0.75, -0.20},  {0.20, 1.25} } })

hl.animation({ leaf = "windows",          enabled = true, speed = 7,  bezier = "myBezier" })
hl.animation({ leaf = "windowsOut",       enabled = true, speed = 7,  bezier = "default", style = "popin 80%" })
hl.animation({ leaf = "border",           enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "borderangle",      enabled = true, speed = 8,  bezier = "default" })
hl.animation({ leaf = "fade",             enabled = true, speed = 7,  bezier = "default" })
hl.animation({ leaf = "workspaces",       enabled = true, speed = 6,  bezier = "bouncy" })
hl.animation({ leaf = "layers",           enabled = true, speed = 5,  bezier = "bouncy",  style = "slide" })
hl.animation({ leaf = "borderangle",      enabled = true, speed = 30, bezier = "default" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 6,  bezier = "default", style = "slidevert" })
