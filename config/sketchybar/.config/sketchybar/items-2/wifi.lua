local colors = require("theme.colors")
local icons = require("theme.icons")
local tokens = require("theme.tokens")
local wifi = sbar.add("item", "items2.wifi", { position = "right", icon = { string = icons.wifi.disconnected, font = tokens.typography.icon.font, color = tokens.typography.muted.color }, label = { font = tokens.typography.text.font }, background = { color = tokens.surface.group, border_color = tokens.border.group, border_width = 1 } })
local function update()
  sbar.exec("ifconfig en0 | awk '/status:/{print $2}'; ipconfig getifaddr en0", function(out)
    local status, ip = tostring(out):match("(%S*)%s*(%S*)")
    local connected = status == "active" and ip ~= ""
    wifi:set({ icon = { string = connected and icons.wifi.connected or icons.wifi.disconnected, color = connected and tokens.typography.accent.color or colors.red }, label = { string = ip, drawing = connected } })
  end)
end
wifi:subscribe({ "wifi_change", "system_woke", "forced" }, update)
update()
