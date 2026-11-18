local icons = require("theme.icons")
local colors = require("theme.colors")
local tokens = require("theme.tokens")

local battery = sbar.add("item", "battery", {
    position = "right",
    update_freq = 180
})

battery:subscribe({"routine", "power_source_change", "system_woke"}, function()
    sbar.exec("pmset -g batt", function(batt_info)
        local charge = tonumber(batt_info:match("(%d+)%%"))
        local color = colors.green
        local icon

        if batt_info:find("AC Power") then
            icon = icons.battery.charging
        elseif charge and charge > 80 then
            icon = icons.battery._100
        elseif charge and charge > 60 then
            icon = icons.battery._75
        elseif charge and charge > 40 then
            icon = icons.battery._50
        elseif charge and charge > 20 then
            icon = icons.battery._25
            color = colors.peach
        else
            icon = icons.battery._0
            color = colors.red
        end

        battery:set({
            icon = {
                string = icon,
                color = color
            },
            label = {
                string = charge and string.format("%02d%%", charge) or "?"
            }
        })
    end)
end)
