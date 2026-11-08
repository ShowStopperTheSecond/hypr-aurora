-- -----------------------------------------------------
-- Aurora layout
-- name: "Aurora"
-- -----------------------------------------------------

hl.config({
    dwindle = {
        preserve_split      = true,
        force_split         = 2,        -- new windows open right / below
        smart_resizing      = true,
        precise_mouse_move  = true,
        special_scale_factor = 0.92,
    },

    -- DEFAULT LAYOUT: master on the left, the rest stacked on the right
    master = {
        orientation        = "left",
        mfact              = 0.58,      -- master takes 58% of the width
        new_status         = "slave",   -- new windows join the stack, master stays put
        new_on_active      = "after",   -- ...right after the focused window
        smart_resizing     = true,
        drop_at_cursor     = true,
        allow_small_split  = false,
        special_scale_factor = 0.92,
    },

    -- scrolling layout (for the 3-finger scroll gesture)
    scrolling = {
        column_width           = 0.6,
        explicit_column_widths = "0.333, 0.5, 0.6, 0.667, 1.0",
        focus_fit_method       = 1,
        wrap_focus             = true,
    },

    binds = {
        workspace_back_and_forth       = 0,
        allow_workspace_cycles         = true,
        pass_mouse_when_bound          = false,
        hide_special_on_workspace_change = true,
        scroll_event_delay             = 150,
        movefocus_cycles_groupfirst    = true,
    },
})
