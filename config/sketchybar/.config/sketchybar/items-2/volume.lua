local icons = require("theme.icons")
local tokens = require("theme.tokens")
local volume = sbar.add("slider", "items2.volume", { position = "right", icon = { string = icons.volume._100, font = tokens.typography.icon.font }, label = { drawing = false }, slider = { width = 90, highlight_color = tokens.typography.accent.color, background = { color = tokens.border.group, height = 4 } }, background = { color = tokens.surface.group, border_color = tokens.border.group, border_width = 1 } })
local function apply(value) volume:set({ icon = { string = value == 0 and icons.volume._0 or value > 60 and icons.volume._100 or value > 30 and icons.volume._66 or icons.volume._33 }, slider = { percentage = value } }) end
volume:subscribe("volume_change", function(env) local v = tonumber(env.INFO); if v then apply(v) end end)
volume:subscribe("mouse.clicked", function(env) sbar.exec("osascript -e 'set volume output volume " .. env.PERCENTAGE .. "'") end)
sbar.exec("osascript -e 'output volume of (get volume settings)'", function(out) local v = tonumber(out); if v then apply(v) end end)
