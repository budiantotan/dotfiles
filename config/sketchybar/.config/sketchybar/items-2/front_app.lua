local tokens = require("theme.tokens")
local app = sbar.add("item", "items2.front_app", { position = "left", icon = { string = "", color = tokens.typography.accent.color, font = tokens.typography.icon.font }, label = { font = tokens.typography.text.font } })
app:subscribe("front_app_switched", function(env) app:set({ label = { string = env.INFO } }) end)
sbar.exec("lsappinfo info -only name \"$(lsappinfo front)\"", function(out) local name = tostring(out):match('"LSDisplayName"="(.-)"'); if name then app:set({ label = { string = name } }) end end)
