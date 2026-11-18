local M = {}

M.family = {
    text = "JetBrainsMono Nerd Font",
    numeric = "JetBrainsMono Nerd Font",
    icon = "JetBrainsMono Nerd Font",
    app_icon = "sketchybar-app-font"
}

M.size = {
    sm = 11,
    md = 13,
    lg = 14,
    xl = 16
}

-- Build a font table: M.get("text", "Semibold", "md")
function M.get(role, style, size)
    return {
        family = M.family[role],
        style = style or "Regular",
        size = M.size[size] or size or M.size.md
    }
end

return M
