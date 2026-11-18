local colors = require("theme.colors")
local tokens = require("theme.tokens")
local spaces = {}
for i = 1, 10 do
  local space = sbar.add("space", "items2.space." .. i, { space = i, position = "left", icon = { string = i, font = tokens.typography.text.font, color = tokens.typography.faint.color, highlight_color = tokens.typography.text.color }, label = { drawing = false }, background = { color = colors.transparent, height = tokens.radius.pill * 2, corner_radius = tokens.radius.pill } })
  spaces[i] = space
  space:subscribe("space_change", function(env)
    local selected = env.SELECTED == "true"
    space:set({ icon = { highlight = selected }, background = { color = selected and tokens.surface.item_active or colors.transparent } })
  end)
  space:subscribe("mouse.clicked", function(env) sbar.exec("yabai -m space --focus " .. env.SID) end)
end
