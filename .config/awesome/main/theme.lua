-- Standard awesome library
local gears = require("gears")
local awful = require("awful")

-- Theme handling library
local beautiful = require("beautiful")

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
local home = os.getenv("HOME")

-- Themes define colours, icons, font and wallpapers.
-- beautiful.init("/usr/share/awesome/themes/default/theme.lua")
-- beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")
beautiful.init(home .. "/.config/awesome/themes/default/theme.lua")

if (theme.wallpaper) then
    local wallpaper = theme.wallpaper
    local wallpapers = theme.wallpapers
    if type(wallpaper) == "string" then theme.wallpaper = wallpaper
    elseif type(wallpaper) == "table" then 
        for s = 1, screen.count() do
            theme.wallpaper = tostring(wallpaper[s]) 
            gears.wallpaper.maximized(beautiful.wallpapers .. beautiful.wallpaper, s, true)
        end
    end
end
