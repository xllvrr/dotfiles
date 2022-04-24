-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
local lain =  require("lain")
local beautiful = require("beautiful")

-- Wibox handling library
local wibox = require("wibox")

-- Custom Local Library: Common Functional Decoration
local deco = {
    wallpaper = require("deco.wallpaper"),
    taglist   = require("deco.taglist"),
}
local gmc = require("themes.gmc")

local taglist_buttons  = deco.taglist()
local terminal = RC.vars.terminal

markup      = lain.util.markup
local _M = {}

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- Wibar

awful.screen.connect_for_each_screen(function(s)

    -- Wallpaper
    -- theme.set_wallpaper(beautiful.wallpaper, s, beautiful.wallpapers)
    set_wallpaper(s)

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()

    -- Create an imagebox widget 
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
        awful.button({ }, 1, function () awful.layout.inc( 1) end),
        awful.button({ }, 3, function () awful.layout.inc(-1) end),
        awful.button({ }, 4, function () awful.layout.inc( 1) end),
        awful.button({ }, 5, function () awful.layout.inc(-1) end)
    ))

    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = taglist_buttons
    }

    -- Create the wibox
    s.mywibox = awful.wibar({ position = "top", screen = s, height = 40 })

    -- Create textclock
    local mytextclock = wibox.widget.textclock()

    -- Create volume widget
    local volume = wibox.widget.imagebox(beautiful.widget_vol)

    volume:buttons(awful.util.table.join(
        awful.button({}, 1, function() -- left click
            awful.spawn(terminal.." -e pulsemixer")
        end)
    ))

    -- Create net widget
    local net = wibox.widget.imagebox(beautiful.widget_wifi)

    net:buttons(awful.util.table.join(
        awful.button({}, 1, function()
            awful.spawn(terminal.." -e nmtui", {
                floating = true, 
                placement = awful.placement.centered,})
        end)
    ))

    -- Create battery widget
    if(awesome.hostname == "archthink")
    then
        local batticon = wibox.widget.imagebox(beautiful.widget_batt)

        local batttext = lain.widget.bat({
            settings = function()
                local numperc = tonumber(bat_now.perc)
                if bat_now.perc == "N/A" then
                    perc = "AC "
                    widget:set_markup(markup(gmc.color['blue300'], perc))
                elseif numperc > 30 then
                    perc = bat_now.perc .. "% "
                    widget:set_markup(markup(gmc.color['white'], perc))
                else
                    perc = bat_now.perc .. "% "
                    widget:set_markup(markup(gmc.color['red500'], perc))
                end
            end
        })
    else
    end

    -- Create Bluetooth Widget
    local blue = wibox.widget.imagebox(beautiful.widget_blue)

    blue:buttons(awful.util.table.join(
        awful.button({}, 1, function() -- left click
            awful.spawn(terminal.." -e bluemenu")
        end),
        awful.button({}, 3, function() -- right click
            awful.spawn(terminal.." -e toggleblue")
        end)
    ))

    -- SysTray
    local systray = wibox.widget.systray()

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            s.mytaglist,
            s.mypromptbox,
        },
        s.mytasklist, -- Middle widget
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            batticon, batttext,
            net,
            blue,
            volume,
            systray,
            mytextclock,
            s.mylayoutbox,
        },
    }

end)
