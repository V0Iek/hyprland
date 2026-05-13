hl.config({
  general = {
    layout = "dwindle",
  },
})

hl.config({
  dwindle = {
    --pseudotile = true,
    force_split = 2,
    preserve_split = true,
    special_scale_factor = 0.95,
  },
})

hl.config({
  master = {
    allow_small_split = true,
    special_scale_factor = 0.95,
  },
})

hl.config({
  scrolling = {
    column_width = 0.7,
    fullscreen_on_one_column = true,
  },
})
