local colors = require("theme.colors");
local fonts = require("theme.fonts");

return {
    spacing = {
        none = 0,
        xs = 2,
        sm = 4,
        md = 8,
        lg = 12,
        xl = 16
    },
    radius = {
        sm = 6,
        md = 8,
        lg = 12,
        xl = 16
    },
    height = {
        bar = 40,
        group = 30
    },
    typography = {
        text = {
            font = fonts.get("text", "Semibold", "lg"),
            color = colors.text
        },
        icon = {
            font = fonts.get("icon", "Regular", "lg"),
            color = colors.text
        },
        muted = {
            font = fonts.get("text", "Semibold", "lg"),
            color = colors.subtext0
        },
        faint = {
            font = fonts.get("text", "Semibold", "lg"),
            color = colors.overlay0
        },
        accent = {
            font = fonts.get("text", "Semibold", "lg"),
            color = colors.blue
        }
    },
    surface = {
        bar = colors.crust,
        group = colors.mantle,
        item_active = colors.blue,
        hover = colors.with_alpha(colors.text, 0.08),
        popup = colors.mantle
    },
    border = {
        group = colors.surface0,
        popup = colors.surface1,
        divider = colors.with_alpha(colors.text, 0.2)
    },
    blur = 20,
    motion = {
        curve = "tanh",
        fast = 8,
        slow = 20
    },

    -- OLD CONFIG

    paddings = 3,
    group_paddings = 5,

    icons = "sf-symbols", -- alternatively available: NerdFont

    -- This is a font configuration for SF Pro and SF Mono (installed manually)
    font = require("helpers.default_font")
}
