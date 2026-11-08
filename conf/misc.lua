-- -----------------------------------------------------
-- Aurora: misc, cursor, render, efficiency
-- -----------------------------------------------------

hl.config({
    misc = {
        disable_hyprland_logo      = true,
        force_default_wallpaper    = 0,
        disable_splash_rendering   = true,
        initial_workspace_tracking = 1,
        on_focus_under_fullscreen  = 1,
        allow_session_lock_restore = true,

        background_color             = 0x0d0e13,   -- matches the Material dark surface
        font_family                  = "Inter",
        animate_manual_resizes       = true,
        animate_mouse_windowdragging = true,
        mouse_move_enables_dpms      = true,
        key_press_enables_dpms       = true,
        vrr                          = 2,          -- adaptive sync in fullscreen only
        close_special_on_empty       = true,
        focus_on_activate            = false,

        -- a terminal that launches mpv / imv / a PDF viewer gets swallowed by it
        enable_swallow    = true,
        swallow_regex     = "^(kitty|Alacritty|alacritty|foot|com.mitchellh.ghostty)$",
        swallow_exception_regex = "^(wev|Wayland-desktop-viewer)$",
    },

    cursor = {
        hide_on_key_press = true,    -- cursor disappears while you type
        inactive_timeout  = 8,       -- ...and after 8 s of stillness
        persistent_warps  = true,
        warp_on_change_workspace = 1,
    },

    render = {
        new_render_scheduling = true, -- triple buffering when the GPU is struggling
    },

    ecosystem = {
        no_update_news  = true,
        no_donation_nag = true,
    },
})
