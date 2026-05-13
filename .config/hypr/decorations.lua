--  ____                           _   _
-- |  _ \  ___  ___ ___  _ __ __ _| |_(_) ___  _ __
-- | | | |/ _ \/ __/ _ \| '__/ _` | __| |/ _ \| '_ \
-- | |_| |  __/ (_| (_) | | | (_| | |_| | (_) | | | |
-- |____/ \___|\___\___/|_|  \__,_|\__|_|\___/|_| |_|
--
-----------------------------------------------------

local colors = require("colors")

hl.config({
  general = {
    gaps_in  = 5,
    gaps_out = 20,

    border_size = 2,

    col = {
      active_border   = { colors = { colors.primary, colors.secondary }, angle = 45 },
      inactive_border = colors.inactive,
    },

    resize_on_border = true,

    allow_tearing = false,
  },

  decoration = {
    rounding       = 15,
    rounding_power = 2,

    active_opacity   = 1.0,
    inactive_opacity = 0.85,

    blur = {
      enabled         = true,
      size            = 7,
      passes          = 3,
      popups          = true,
      ignore_opacity  = true
    },
  },
})

