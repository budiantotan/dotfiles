local icons = require("theme.icons")
local tokens = require("theme.tokens")
local state = sbar.add("item", "items2.media.state", {
    position = "right",
    icon = {
        string = icons.media.play_pause,
        font = tokens.typography.icon.font,
        color = tokens.typography.accent.color
    },
    label = {
        drawing = false
    }
})
local track = sbar.add("item", "items2.media.track", {
    position = "right",
    icon = {
        drawing = false
    },
    label = {
        font = tokens.typography.text.font,
        max_chars = 36,
        color = tokens.typography.muted.color
    },
    drawing = false
})
state:subscribe("mouse.clicked", function()
    sbar.exec("nowplaying-cli togglePlayPause")
end)
state:subscribe("media_change", function(env)
    local info = env.INFO
    local active = info and (info.app == "Spotify" or info.app == "Music")
    if not active then
        track:set({
            drawing = false
        });
        return
    end
    local playing = info.state == "playing"
    state:set({
        icon = {
            string = icons.media.play_pause,
            color = playing and tokens.typography.accent.color or tokens.typography.muted.color
        }
    })
    track:set({
        drawing = true,
        label = {
            string = info.artist ~= "" and (info.title .. "  ·  " .. info.artist) or info.title,
            color = playing and tokens.typography.text.color or tokens.typography.muted.color
        }
    })
end)
