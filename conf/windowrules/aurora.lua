-- -----------------------------------------------------
-- Aurora window rules
-- -----------------------------------------------------

-- Terminals: slightly see-through so the wallpaper colour glows through
hl.window_rule({
    name  = "aurora-terminals",
    match = { class = "^(kitty|Alacritty|alacritty|foot|footclient|com.mitchellh.ghostty|org.wezfurlong.wezterm|ptyxis|org.gnome.Console|org.kde.konsole)$" },
    opacity = "0.93 0.88",
})

-- Never dim / blur / tint video and games
hl.window_rule({ name = "aurora-video", match = { content = "video" }, no_dim = true, opaque = true })
hl.window_rule({ name = "aurora-game",  match = { content = "game"  }, no_dim = true, no_blur = true, no_shadow = true, opaque = true })

-- Don't let the screen lock or sleep while something is fullscreen
hl.window_rule({ name = "aurora-idle-inhibit", match = { class = ".*" }, idle_inhibit = "fullscreen" })

-- Dim the desktop behind pickers and dialogs so they take focus
hl.window_rule({ name = "aurora-dim-portal",  match = { class = "^(xdg-desktop-portal-gtk|org.freedesktop.impl.portal.desktop.gtk)$" }, dim_around = true })
hl.window_rule({ name = "aurora-dim-modal",   match = { modal = true }, dim_around = true })

-- Floating windows remember their size
hl.window_rule({ name = "aurora-float-size", match = { float = true }, persistent_size = true })

-- Picture-in-picture: no shadow, no dimming, stays crisp
hl.window_rule({ name = "aurora-pip", match = { title = "^([Pp]icture[-\\s]?[Ii]n[-\\s]?[Pp]icture)(.*)$" }, no_dim = true, no_shadow = true, no_blur = true })

-- Maximised / fullscreen workspaces: no gaps, no rounding, no border
hl.workspace_rule({ workspace = "f[1]s[false]", gaps_out = 0, gaps_in = 0 })
hl.window_rule({ name = "aurora-max-border",   match = { float = false, workspace = "f[1]s[false]" }, border_size = 0 })
hl.window_rule({ name = "aurora-max-rounding", match = { float = false, workspace = "f[1]s[false]" }, rounding = 0 })
