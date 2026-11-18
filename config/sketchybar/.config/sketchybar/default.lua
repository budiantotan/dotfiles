local tokens = require("theme.tokens");
local colors = require("theme.colors");

sbar.default({
    updates = "when_shown",
    icon = {
        font = tokens.typography.icon.font,
        color = tokens.typography.icon.color,
        padding_left = tokens.spacing.lg,
        padding_right = tokens.spacing.sm
    },
    label = {
        font = tokens.typography.text.font,
        color = tokens.typography.text.color,
        padding_left = tokens.spacing.sm,
        padding_right = tokens.spacing.lg
    },
    background = {
        height = tokens.height.group,
        corner_radius = tokens.radius.lg,
        color = tokens.surface.group
    },
    popup = {
        background = {
            color = tokens.surface.popup,
            border_color = tokens.border.popup,
            border_width = tokens.spacing.xs,
            corner_radius = tokens.radius.md,
            shadow = {
                drawing = true
            }
        },
        blur_radius = tokens.blur
    },
    padding_left = tokens.spacing.xs,
    padding_right = tokens.spacing.xs,
    scroll_texts = true
})
