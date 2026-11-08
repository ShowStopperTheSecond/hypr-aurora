-- -----------------------------------------------------
-- Aurora extra keybindings
-- -----------------------------------------------------
local mainMod = "SUPER"

-- Cycle visual profile: showcase -> balanced -> battery
hl.bind(mainMod .. " + ALT + P", function() aurora_cycle() end,
    { description = "Cycle Aurora visual profile (showcase / balanced / battery)" })

-- Master / stack layout helpers
hl.bind(mainMod .. " + CTRL + M",         hl.dsp.layout("addmaster"),    { description = "Add a window to the master area" })
hl.bind(mainMod .. " + CTRL + SHIFT + M", hl.dsp.layout("removemaster"), { description = "Remove a window from the master area" })
hl.bind(mainMod .. " + comma",            hl.dsp.layout("mfact -0.03"),  { repeating = true, description = "Shrink master area" })
hl.bind(mainMod .. " + period",           hl.dsp.layout("mfact +0.03"),  { repeating = true, description = "Grow master area" })
