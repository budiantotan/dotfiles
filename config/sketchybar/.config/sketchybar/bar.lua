local colors = require("theme.colors")
local tokens = require("theme.tokens")

sbar.bar({
    topmost = "window",
    height = tokens.height.bar,
    color = colors.with_alpha(colors.base, .6),
    padding_left = tokens.spacing.lg,
    padding_right = tokens.spacing.lg
    -- margin = 2,
    -- corner_radius = tokens.radius.xl,
    -- y_offset = 2
})
