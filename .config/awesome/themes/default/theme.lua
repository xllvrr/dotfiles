local awful = require("awful")
awful.util = require("awful.util")

theme_path = awful.util.getdir("config") .. "themes/default/"

-- default variables

theme = {}

dofile(theme_path .. "elements.lua")
dofile(theme_path .. "icons.lua")
dofile(theme_path .. "layouts.lua")

theme.wallpaper          = "~/.config/wall.jpg"
theme.awesome_icon       = theme_path .. "launcher/arch.png"
theme.awesome_subicon    = theme_path .. "launcher/arch.png"

return theme
