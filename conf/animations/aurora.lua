-- -----------------------------------------------------
-- Aurora animations
-- name: "Aurora"
-- Spring physics for movement (feels alive, settles fast),
-- crisp bezier curves for fades.
-- -----------------------------------------------------

hl.config({
    animations = {
        enabled              = true,
        workspace_wraparound = true,
    },
})

-- Movement curves. With AURORA_EXPERIMENTAL (new Hyprland) these become
-- real spring physics; otherwise tuned beziers with a hint of overshoot.
local sp_window, sp_move, sp_space = {}, {}, {}
if AURORA_EXPERIMENTAL then
    hl.curve("sp_window", { type = "spring", mass = 1, stiffness = 260, damping = 26 })
    hl.curve("sp_move",   { type = "spring", mass = 1, stiffness = 300, damping = 30 })
    hl.curve("sp_space",  { type = "spring", mass = 1, stiffness = 200, damping = 28 })
    sp_window, sp_move, sp_space = { spring = "sp_window" }, { spring = "sp_move" }, { spring = "sp_space" }
else
    hl.curve("sp_window", { type = "bezier", points = { {0.30, 1.20}, {0.55, 1.00} } })
    hl.curve("sp_move",   { type = "bezier", points = { {0.22, 1.00}, {0.36, 1.00} } })
    hl.curve("sp_space",  { type = "bezier", points = { {0.16, 1.00}, {0.30, 1.00} } })
    sp_window, sp_move, sp_space = { bezier = "sp_window" }, { bezier = "sp_move" }, { bezier = "sp_space" }
end

local function anim(leaf, speed, curve, style)
    local t = { leaf = leaf, enabled = true, speed = speed, style = style }
    for k, v in pairs(curve) do t[k] = v end
    hl.animation(t)
end

-- Beziers
hl.curve("snap",  { type = "bezier", points = { {0.20, 0.90}, {0.10, 1.00} } })
hl.curve("glide", { type = "bezier", points = { {0.16, 1.00}, {0.30, 1.00} } })
hl.curve("exit",  { type = "bezier", points = { {0.50, 0.00}, {0.90, 0.50} } })

-- Windows
anim("windowsIn", 5, sp_window, "popin 92%")
hl.animation({ leaf = "windowsOut",  enabled = true, speed = 3, bezier = "exit",      style = "popin 94%" })
anim("windowsMove", 5, sp_move)
anim("windows", 5, sp_move)

-- Fades
hl.animation({ leaf = "fade",        enabled = true, speed = 3, bezier = "snap" })
hl.animation({ leaf = "fadeShadow",  enabled = true, speed = 5, bezier = "snap" })
hl.animation({ leaf = "fadeDim",     enabled = true, speed = 5, bezier = "snap" })
hl.animation({ leaf = "fadePopups",  enabled = true, speed = 3, bezier = "snap" })
hl.animation({ leaf = "fadeDpms",    enabled = true, speed = 6, bezier = "glide" })

-- Borders: colour eases, gradient swings round once on focus change
hl.animation({ leaf = "border",      enabled = true, speed = 6,  bezier = "snap" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 40, bezier = "glide", style = "once" })
if AURORA_EXPERIMENTAL then
    hl.animation({ leaf = "shadowangle", enabled = true, speed = 40, bezier = "glide", style = "once" })
    hl.animation({ leaf = "glowangle",   enabled = true, speed = 40, bezier = "glide", style = "once" })
    hl.animation({ leaf = "fadeGlow",    enabled = true, speed = 5,  bezier = "snap" })
end

-- Panels / menus
hl.animation({ leaf = "layersIn",      enabled = true, speed = 3.5, bezier = "glide", style = "slide" })
hl.animation({ leaf = "layersOut",     enabled = true, speed = 2.5, bezier = "exit",  style = "slide" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true, speed = 3,   bezier = "snap" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 2.5, bezier = "exit" })

-- Workspaces
anim("workspaces", 5, sp_space, "slide")
anim("specialWorkspace", 4, sp_space, "slidefadevert 20%")
