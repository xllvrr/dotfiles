-- Notification library
local naughty = require("naughty")
local nconf = naughty.config

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- Border properties
nconf.defaults.border_width = 2
nconf.defaults.margin = 16
nconf.defaults.text = "Boo!"
nconf.defaults.timeout = 3
nconf.padding = 4
nconf.spacing = 4

-- Critical alert
nconf.presets.critical.bg = "#900000"
nconf.presets.critical.fg = "#ffffff"

-- Low priority
nconf.presets.low.bg = "#222222"
nconf.presets.low.fg = "#ffffff"

-- Normal priority
nconf.presets.normal.bg = "#222222"
nconf.presets.normal.fg = "#ffffff"

-- Icon size
nconf.defaults.icon_size = 20
