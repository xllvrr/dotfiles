local awful = require("awful")
awful.util = require("awful.util")

theme_path = awful.util.getdir("config") .. "themes/default/"

-- default variables

theme = {}

dofile(theme_path .. "elements.lua")
dofile(theme_path .. "icons.lua")
dofile(theme_path .. "layouts.lua")

theme.wallpapers         = theme_path .. "wallpapers/"
if awesome.hostname == "archmain"
then theme.wallpaper          = {"wide.jpg", "1080.jpg"}
elseif awesome.hostname == "archthink"
then theme.wallpaper          = "1080.jpg"
end
theme.awesome_icon       = theme_path .. "launcher/arch.png"
theme.awesome_subicon    = theme_path .. "launcher/arch.png"

return theme
