-- Standard awesome library
local gears = require("gears")
local awful = require("awful")

-- Widget and layout library
local wibox = require("wibox")

-- Theme handling library
local beautiful = require("beautiful")

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c)
  -- Set the windows at the slave,
  -- i.e. put it at the end of others instead of setting it master.
  if not awesome.startup then awful.client.setslave(c) end

  if awesome.startup
    and not c.size_hints.user_position
    and not c.size_hints.program_position then
      -- Prevent clients from being unreachable after screen count changes.
      awful.placement.no_offscreen(c)
  end
end)


-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
    c:emit_signal("request::activate", "mouse_enter", {raise = false})
end)

client.connect_signal("focus",
        function(c)
                if c.maximized_horizontal == true and c.maximized_vertical == true then
                        c.border_width = "0"
                        c.border_color = beautiful.border_focus
                else
                        c.border_width = beautiful.border_width
                        c.border_color = beautiful.border_focus
                end
        end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)

-- Enable focus on tag switch
function focus_client_under_mouse()
    gears.timer( {  timeout = 0.1,
                    autostart = true,
                    single_shot = true,
                    callback =  function()
                                    local n = mouse.object_under_pointer()
                                    if n ~= nil and n ~= client.focus then
                                        client.focus = n end
                                    end
                  } )
end

screen.connect_signal( "tag::history::update", focus_client_under_mouse )

