# Aurora v2

Optional packages (Arch):

    sudo pacman -S inter-font ttf-jetbrains-mono-nerd ttf-vazirmatn brightnessctl

Visual profiles (SUPER + ALT + P cycles them live):
  showcase  max glass blur + deep accent glow (lens blur, wobble, motion blur, springs with AURORA_EXPERIMENTAL = true in functions.lua, Hyprland 0.57+)
  balanced  daily driver (default, set in conf/decorations/aurora.lua)
  battery   no blur / shadow / glow

Tweak the look in functions.lua (aurora_profile_table).
Back to stock: in conf/decoration.lua, window.lua, animation.lua, layout.lua,
windowrule.lua change "aurora.lua" to "default.lua".

Every option used was checked against the official Hyprland wiki.
