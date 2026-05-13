hl.layer_rule({
  match = { namespace = "swaync-control-center" },
  blur = true,
  ignore_alpha = 0.5
})

hl.layer_rule({
  match = { namespace = "swaync-notification-window" },
  blur = true,
  ignore_alpha = 0.5
})
