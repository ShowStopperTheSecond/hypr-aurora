# Aurora

A calm, dark, fast Hyprland setup. The focused window glows in your wallpaper's accent colour, everything else steps back, and a master and stack layout keeps tiling predictable.

Aurora is a drop-in visual layer for [ML4W dotfiles](https://github.com/mylinuxforwork/dotfiles) (the Lua-config version). It reuses ML4W's Material You colours, so the whole desktop re-themes itself whenever you change the wallpaper.

<!-- Add screenshots here, for example:
![Desktop](screenshots/desktop.png)
![Lock screen](screenshots/lockscreen.png)
-->

## Features

**Look**
- Gradient accent border and a soft accent glow under the focused window. Unfocused windows fade to hairlines.
- Squircle corners, light frosted blur, and blurred panels, launchers and notifications.
- Slim blurred title bars for tabbed groups.
- Lock screen with a huge thin clock (hour in white, minutes in the accent colour), the date, the keyboard layout and the battery level.

**Layout and behaviour**
- Master and stack is the default layout: master on the left, new windows join the stack on the right.
- Floating windows snap to edges and neighbours, and remember their size.
- Fullscreen and maximised windows drop gaps, rounding and borders.
- Terminals are slightly transparent. Video and games are never dimmed or blurred.
- A terminal that launches a viewer such as mpv gets swallowed by it.
- Fullscreen windows stop the screen from locking.

**Efficiency**
- Three visual profiles, switchable live: `showcase`, `balanced` (default) and `battery`.
- Game mode also switches off the extra effects.
- Idle plan: dim at 4 min, lock at 7, screen off at 8, suspend at 20.
- `hyprsunset` follows the day, from neutral in daylight to warmer in the evening and late at night.

**Input**
- Faster key repeat, numlock on at start, touchpad drag-lock, US and Persian layouts (`Alt+Shift` toggles).

## Requirements

- Hyprland **0.55 or newer** with the Lua configuration
- [ML4W dotfiles](https://github.com/mylinuxforwork/dotfiles), which provide the generated `colors.lua` and `colors.conf` palette and the helper scripts that the keybindings call
- `hyprlock`, `hypridle`, `hyprsunset`, `brightnessctl`
- Fonts (Arch package names):

```sh
sudo pacman -S inter-font ttf-jetbrains-mono-nerd ttf-vazirmatn
```

Inter is used for the interface and lock screen. Vazirmatn is a good Persian font to pair with it.

## Install

```sh
# back up your current config
mv ~/.config/hypr ~/.config/hypr.bak

# install Aurora
git clone https://github.com/<your-user>/<this-repo>.git
cp -r <this-repo>/hypr ~/.config/hypr

# reload
hyprctl reload
```

If you keep your own files, copy only what you want. Everything lives in the `aurora.lua` variant files, so the stock ML4W look is always one edit away (see below).

## Keybindings

Everything from ML4W still works. Aurora changes or adds these:

| Keys | Action |
| --- | --- |
| `Super + Alt + P` | Cycle visual profile: showcase, balanced, battery |
| `Super + J` | Swap the focused window with the master (promote) |
| `Super + K` | Rotate master orientation: left, top, right, bottom, centre |
| `Super + Ctrl + M` | Add a window to the master area |
| `Super + Ctrl + Shift + M` | Remove a window from the master area |
| `Super + ,` / `Super + .` | Shrink / grow the master area |
| `Super + Shift + A` | Toggle animations |
| `Super + Alt + G` | Toggle game mode |

## Profiles

| Profile | What it does |
| --- | --- |
| `showcase` | Maximum glass blur and a deep accent glow |
| `balanced` | The daily setting. Light blur, soft glow, everything on |
| `battery` | No blur, no shadows, no glow |

The profiles are defined in `hypr/functions.lua`. The default is set in `hypr/conf/decorations/aurora.lua`.

## Customising

| I want to change | Edit |
| --- | --- |
| Gaps, borders, snapping, tabbed groups | `hypr/conf/windows/aurora.lua` |
| Blur, shadow, rounding, profiles | `hypr/functions.lua` |
| Animations | `hypr/conf/animations/aurora.lua` |
| Master and stack settings (`mfact`, `orientation`, `new_status`) | `hypr/conf/layouts/aurora.lua` |
| Window rules (opacity, idle inhibit, and so on) | `hypr/conf/windowrules/aurora.lua` |
| Cursor, vrr, swallow, misc | `hypr/conf/misc.lua` |
| Keyboard layouts, repeat rate, touchpad | `hypr/input.lua` |
| Lock screen | `hypr/hyprlock.conf` |
| Idle timings | `hypr/hypridle.conf` |
| Night-light schedule | `hypr/hyprsunset.conf` |

To go back to the stock ML4W look, change `"aurora.lua"` to `"default.lua"` in `conf/decoration.lua`, `window.lua`, `animation.lua`, `layout.lua` and `windowrule.lua`.

## Newer Hyprland (0.57+)

Some effects only exist in the newest Hyprland: lens-style `acrylic` blur, inner glow, window wobble, motion blur and spring animations. Older versions reject them with "unknown config key" errors, so they are off by default.

After updating Hyprland to 0.57 or later, set this line in `hypr/functions.lua`:

```lua
AURORA_EXPERIMENTAL = true
```

## Notes

- Every config option was checked against the official Hyprland wiki.
- `colors.lua` and `colors.conf` in this repo are example output. ML4W regenerates them from your wallpaper.
- Aurora does not restyle waybar, rofi or swaync. It only adds blur and animation rules for them.

## Credits

- [Hyprland](https://hyprland.org/) and the Hypr ecosystem
- [ML4W dotfiles](https://github.com/mylinuxforwork/dotfiles) by Stephan Raabe, which Aurora builds on

