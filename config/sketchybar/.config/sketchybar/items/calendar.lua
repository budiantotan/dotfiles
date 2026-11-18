local tokens = require("theme.tokens");

local calendar = sbar.add("item", {
    position = "right",
    label = {
        color = tokens.typography.accent.color
    },
    update_freq = 1,
    click_script = "open -a 'Calendar'"
})

local function update()
    calendar:set({
        icon = {
            string = os.date("%a %d %b")
        },
        label = {
            string = os.date("%I:%M %p")
        }
    })
end

calendar:subscribe({"routine", "forced", "system_woke"}, update)
