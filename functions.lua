-- =====================================================
-- Functions
-- =====================================================

-- Take a generated palette colour ("rgba(b1c5ffff)") and swap its alpha:
-- with_alpha(primary, "40") -> "rgba(b1c5ff40)"
function with_alpha(color, aa)
    return (color:gsub("%x%x%)$", aa .. ")"))
end

-- -----------------------------------------------------
-- Aurora visual profiles
--   showcase : max glass blur, deep accent glow (+ lens blur / wobble / motion blur when AURORA_EXPERIMENTAL)
--   balanced : the daily driver (default)
--   battery  : no blur / shadows / glow, minimal GPU work
-- Cycle at runtime with SUPER + ALT + P.
-- -----------------------------------------------------
AURORA_PROFILES = { "showcase", "balanced", "battery" }
AURORA_CURRENT  = "balanced"

-- Newest Hyprland features (glow, wobble, motion blur, lens-style "acrylic"
-- blur, spring animations). They need Hyprland 0.57+ / a recent git build;
-- older versions print "unknown config key" errors for them.
-- Flip this to true after you update Hyprland.
AURORA_EXPERIMENTAL = false

local function aurora_profile_table(name)
    local accent = with_alpha(primary, "46")

    if name == "battery" then
        local t = {
            decoration = {
                rounding = 10,
                inactive_opacity = 1.0,
                dim_inactive = false,
                shadow = { enabled = false },
                blur   = { enabled = false },
            },
        }
        if AURORA_EXPERIMENTAL then
            t.decoration.glow        = { enabled = false }
            t.decoration.wobble      = { enabled = false }
            t.decoration.motion_blur = { enabled = false }
        end
        return t
    end

    local showcase = (name == "showcase")

    local t = {
        decoration = {
            rounding         = 12,
            rounding_power   = 3.0,
            inactive_opacity = showcase and 0.93 or 0.95,
            dim_inactive     = true,
            dim_strength     = 0.05,

            -- accent glow under the focused window only
            shadow = {
                enabled        = true,
                range          = showcase and 48 or 28,
                render_power   = 3,
                offset         = { 0, showcase and 10 or 0 },
                color          = showcase and with_alpha(primary, "58") or accent,
                color_inactive = "rgba(00000000)",
            },

            blur = {
                enabled           = true,
                size              = showcase and 9 or 5,
                passes            = showcase and 4 or 3,
                new_optimizations = true,
                ignore_opacity    = true,
                xray              = not showcase,   -- showcase: true glass, windows blur what is behind them
                noise             = 0.015,
                contrast          = 1.0,
                brightness        = 0.95,
                vibrancy          = showcase and 0.3 or 0.2,
                popups            = true,
                popups_ignorealpha = 0.2,
            },
        },
    }

    if AURORA_EXPERIMENTAL then
        local d = t.decoration
        d.glow = {
            enabled        = showcase,
            range          = 10,
            render_power   = 3,
            color          = { colors = { with_alpha(primary, "38"), with_alpha(tertiary, "38") }, angle = 135 },
            color_inactive = "rgba(00000000)",
        }
        d.wobble      = { enabled = showcase, intensity = 0.12, stiffness = 220, damping = 16 }
        d.motion_blur = { enabled = showcase, samples = 6 }
        d.blur.variant = showcase and "acrylic" or "kawase"
        d.blur.acrylic = {
            refraction = 14.0, bulb = 36.0, clarity = 0.78, aberration = 0.02,
            tint = with_alpha(primary, "10"),
        }
    end

    return t
end

function aurora_profile(name)
    hl.config(aurora_profile_table(name))
    AURORA_CURRENT = name
end

function aurora_cycle()
    local idx = 1
    for i, n in ipairs(AURORA_PROFILES) do
        if n == AURORA_CURRENT then idx = i end
    end
    local nxt = AURORA_PROFILES[(idx % #AURORA_PROFILES) + 1]
    aurora_profile(nxt)
    hl.exec_cmd("hyprctl notify 1 2500 'rgb(b1c5ff)' 'Aurora profile: " .. nxt .. "'")
end

-- -----------------------------------------------------
-- Game Mode: strip everything that costs frames
-- -----------------------------------------------------
function activate_gamemode()
    hl.config({
        animations = { enabled = false },
        decoration = {
            shadow      = { enabled = false },
            blur        = { enabled = false },
            dim_inactive       = false,
            active_opacity     = 1.0,
            inactive_opacity   = 1.0,
            fullscreen_opacity = 1.0,
            rounding           = 0,
        },
        general = {
            gaps_in     = 0,
            gaps_out    = 0,
            border_size = 1,
        },
    })
    if AURORA_EXPERIMENTAL then
        hl.config({ decoration = {
            glow = { enabled = false }, wobble = { enabled = false }, motion_blur = { enabled = false },
        } })
    end
    print("Gamemode ON")
end

-- Load Variant
function load_variant(variant_file, variant_name)
    variant_file = variant_file:gsub(".lua", "")
    require("conf." .. variant_name .. "." .. variant_file)
end
