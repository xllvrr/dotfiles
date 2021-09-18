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
  mytextclock = wibox.widget.textclock()

  -- Create volume widget
  volume = wibox.widget.imagebox(beautiful.widget_vol)

  volume:buttons(awful.util.table.join(
        awful.button({}, 1, function() -- left click
            awful.spawn(terminal.." -e pulsemixer")
        end),
        awful.button({}, 2, function() -- middle click
            os.execute(string.format("pactl set-sink-volume %s 100%%", volume.device))
            volume.update()
        end),
        awful.button({}, 3, function() -- right click
            os.execute(string.format("pactl set-sink-mute %s toggle", volume.device))
            volume.update()
        end),
        awful.button({}, 4, function() -- scroll up
            os.execute(string.format("pactl set-sink-volume %s +1%%", volume.device))
            volume.update()
        end),
        awful.button({}, 5, function() -- scroll down
            os.execute(string.format("pactl set-sink-volume %s -1%%", volume.device))
            volume.update()
        end)
    ))

  -- Create net widget
  net = wibox.widget.imagebox(beautiful.widget_wifi)

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
          mybattery = lain.widget.bat()

          -- Notifications
            bat_notification_charged_preset = {
                    title   = "Battery full",
                    text    = "You can unplug the cable",
                    timeout = 15,
                    fg      = "#202020",
                    bg      = "#CDCDCD"
                }

            bat_notification_low_preset = {
                    title = "Battery low",
                    text = "Plug the cable!",
                    timeout = 15,
                    fg = "#202020",
                    bg = "#CDCDCD"
            }

      else
  end


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
      mybattery,
      net,
      volume,
      wibox.widget.systray(),
      mytextclock,
      s.mylayoutbox,
    },
  }
  
end)
