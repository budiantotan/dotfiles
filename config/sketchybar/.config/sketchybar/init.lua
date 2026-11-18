-- Set paths
local xdg_data = os.getenv("XDG_DATA_HOME")
local xdg_config = os.getenv("XDG_CONFIG_HOME")

package.path = package.path .. ";" .. xdg_config .. "/sketchybar/?.lua"
package.cpath = package.cpath .. ";" .. xdg_data .. "/sketchybar_lua/?.so"

-- Require the sketchybar module
sbar = require("sketchybar")

-- Bundle the entire initial configuration into a single message to sketchybar
sbar.begin_config()
sbar.hotload(true)
require("bar")
require("default")
require("items")
sbar.end_config()

-- Run the event loop of the sketchybar module
sbar.event_loop()
