-- -----------------------------------------------------
-- Aurora decoration
-- name: "Aurora"
-- The look itself lives in functions.lua (aurora_profile) so it
-- can be switched live with SUPER + ALT + P.
-- -----------------------------------------------------

aurora_profile("balanced")

-- Frosted panels, launchers, notifications
hl.layer_rule({
    name  = "aurora-blur-layers",
    match = { namespace = "^(waybar|rofi|swaync-control-center|swaync-notification-window|wlogout|logout_dialog|launcher|gtk-layer-shell)$" },
    blur         = true,
    blur_popups  = true,
    ignore_alpha = 0.3,
})

-- Launcher pops in from the centre, notifications slide from the right
hl.layer_rule({ name = "aurora-anim-launcher", match = { namespace = "^(rofi|launcher|wlogout|logout_dialog)$" }, animation = "popin 90%" })
hl.layer_rule({ name = "aurora-anim-notify",   match = { namespace = "^(swaync-notification-window|swaync-control-center)$" }, animation = "slide right" })

-- Screenshot area selection must never animate
hl.layer_rule({ name = "aurora-no-anim-selection", match = { namespace = "^(selection|hyprpicker|slurp)$" }, no_anim = true })
