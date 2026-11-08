-- -----------------------------------------------------
-- Input
-- -----------------------------------------------------

hl.config({
    input = {
        kb_layout    = "us, ir",
        kb_variant   = "",
        kb_model     = "",
        kb_options   = "grp:alt_shift_toggle",
        kb_rules     = "",

        follow_mouse = 1,
        sensitivity  = 0, -- -1.0 - 1.0, 0 means no modification.

        -- snappier typing
        repeat_delay = 260,
        repeat_rate  = 40,
        numlock_by_default = true,

        touchpad = {
            natural_scroll      = true,
            disable_while_typing = true,
            tap_to_click        = true,
            tap_and_drag        = true,
            drag_lock           = 1,     -- lift a finger mid-drag without dropping the item
            scroll_factor       = 0.8,
        },
    },

    gestures = {
        workspace_swipe_distance   = 400,
        workspace_swipe_cancel_ratio = 0.35,
        workspace_swipe_min_speed_to_force = 25,
    },
})
