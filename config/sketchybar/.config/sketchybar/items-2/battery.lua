local colors = require("theme.colors")
local icons = require("theme.icons")
local tokens = require("theme.tokens")
local battery = sbar.add("item", "items2.battery", {
    position = "right",
    icon = {
        font = tokens.typography.icon.font
    },
    label = {
        font = tokens.typography.text.font
    },
    background = {
        color = tokens.surface.group,
        border_color = tokens.border.group,
        border_width = 1
    },
    update_freq = 120
})
local function update()
    sbar.exec("pmset -g batt", function(out)
        local pct = tonumber(out:match("(%d+)%%"))
        if not pct then
            battery:set({
                drawing = false
            });
            return
        end
        local charging = out:find("AC Power") ~= nil
        local icon = charging and icons.battery.charging or
                         (pct > 80 and icons.battery._100 or pct > 60 and icons.battery._75 or pct > 40 and
                             icons.battery._50 or pct > 20 and icons.battery._25 or icons.battery._0)
        battery:set({
            drawing = true,
            icon = {
                string = icon,
                color = pct <= 20 and colors.red or pct <= 40 and colors.orange or colors.green
            },
            label = {
                string = pct .. "%"
            }
        })
    end)
end
battery:subscribe({"routine", "forced", "power_source_change", "system_woke"}, update)
update()
