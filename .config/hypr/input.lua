---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout  = "pl",
        kb_variant = "",
        kb_model   = "",
        kb_options = "lv3:lalt_switch",
        kb_rules   = "",

        follow_mouse = 1,

        sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

        touchpad = {
            natural_scroll = false,
        },
    },
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})

-- Logitech G502
hl.device({
    name        = "logitech-g502-1",
    sensitivity = -0.5,
})
