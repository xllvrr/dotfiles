local awful = require("awful")
awful.util = require("awful.util")

theme_path = awful.util.getdir("config") .. "/themes"

-- default variables

theme = {}

dofile(theme_path .. "elements.lua")
dofile(theme_path .. "layouts.lua")

theme.wallpaper          = "/home/xllvr/.config/wall.jpg"
theme.awesome_icon       = theme_path .. "launcher/Arch.png"
theme.awesome_subicon    = theme_path .. "launcher/Arch.png"

return theme
