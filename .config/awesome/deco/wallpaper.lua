-- Standard awesome library
local gears = require("gears")
local beautiful = require("beautiful")

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

function set_wallpaper(s)
    -- Wallpaper
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        local wallpaper_path = beautiful.wallpapers
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "table" then
            for s = 1, screen.count() do
                wallpaper = tostring(wallpaper[s] or "")
                gears.wallpaper.maximized(wallpaper_path .. wallpaper, s, true)
            end
        else
            gears.wallpaper.maximized(wallpaper_path .. wallpaper, 1, true)
        end
    end
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)
