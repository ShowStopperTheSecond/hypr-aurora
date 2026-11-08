-- -----------------------------------------------------
-- Aurora windows
-- name: "Aurora"
-- -----------------------------------------------------

hl.config({
    general = {
        gaps_in     = 5,
        gaps_out    = 12,
        border_size = 2,
        col = {
            active_border   = { colors = { primary, tertiary }, angle = 135 },
            inactive_border = with_alpha(outline_variant, "88"),
            nogroup_border        = with_alpha(error, "88"),
            nogroup_border_active = error,
        },
        resize_on_border        = true,
        extend_border_grab_area = 12,
        hover_icon_on_border    = true,
        allow_tearing           = false,
        layout                  = "master",

        -- floating windows snap to neighbours and screen edges
        snap = {
            enabled        = true,
            respect_gaps   = true,
            window_gap     = 12,
            monitor_gap    = 12,
        },
    },

    group = {
        auto_group = false,
        col = {
            border_active   = { colors = { primary, tertiary }, angle = 135 },
            border_inactive = with_alpha(outline_variant, "88"),
            border_locked_active   = { colors = { error, tertiary }, angle = 135 },
            border_locked_inactive = with_alpha(error, "66"),
        },
        groupbar = {
            enabled           = true,
            blur              = true,
            font_family       = "Inter",
            font_size         = 11,
            font_weight_active   = "semibold",
            font_weight_inactive = "normal",
            height            = 22,
            gradients         = true,
            gradient_rounding = 8,
            gradient_rounding_power = 3.0,
            gradient_round_only_edges = false,
            rounding          = 8,
            rounding_power    = 3.0,
            indicator_height  = 0,
            gaps_in           = 3,
            gaps_out          = 3,
            text_padding      = 8,
            render_titles     = true,
            scrolling         = true,
            text_color          = on_surface,
            text_color_inactive = on_surface_variant,
            col = {
                active   = primary_container,
                inactive = with_alpha(surface_container, "cc"),
                locked_active   = error_container,
                locked_inactive = with_alpha(surface_container, "cc"),
            },
        },
    },
})
