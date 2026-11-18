local icons = require("theme.icons")
local tokens = require("theme.tokens")
local apple = sbar.add("item", "items2.apple", { position = "left", icon = { string = icons.apple, font = tokens.typography.icon.font, color = tokens.typography.text.color }, label = { drawing = false }, background = { color = tokens.surface.group, border_color = tokens.border.group, border_width = 1 }, popup = { align = "center" } })
for _, entry in ipairs({ { "settings", icons.gear, "Settings", "open -a 'System Settings'" }, { "activity", icons.cpu, "Activity Monitor", "open -a 'Activity Monitor'" }, { "lock", "􀒳", "Lock Screen", "pmset displaysleepnow" } }) do
  sbar.add("item", "items2.apple." .. entry[1], { position = "popup." .. apple.name, icon = { string = entry[2], color = tokens.typography.accent.color }, label = { string = entry[3] }, click_script = entry[4] })
end
apple:subscribe("mouse.clicked", function() apple:set({ popup = { drawing = "toggle" } }) end)
