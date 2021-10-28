-- Standard Awesome library
local gears = require("gears")
local awful = require("awful")

local _M = {}
local modkey = RC.vars.modkey

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

function _M.get()
  local clientkeys = gears.table.join(

    -- Handling Window States
    awful.key({ modkey,           }, "f",
      function (c)
        c.fullscreen = not c.fullscreen
        c:raise()
      end,
      {description = "toggle fullscreen", group = "client"}),
    awful.key({ modkey, }, "c",      function (c) c:kill()                         end,
              {description = "close", group = "client"}),
    awful.key({ modkey, }, "o",  awful.client.floating.toggle                     ,
              {description = "toggle floating", group = "client"}),
    awful.key({ modkey, "Mod1"   }, "c",
        function (c)
            if c.pid then
                awful.spawn("kill -9 " .. c.pid)
            end end,
        {description = "kill", group = "client"}),
    awful.key({ "Control", "Mod1" }, "m",
        function (c)
            c.maximized_horizontal = false
            c.maximized_vertical = false
            c.maximized = not c.maximized
            c:raise()
        end ,
        {description = "maximize", group = "client"}),

    -- Layout Control
    awful.key({ "Control", "Shift" }, "m", function (c) c:swap(awful.client.getmaster()) end,
              {description = "move to master", group = "client"}),
    -- awful.key({ "Control", "Shift" }, "s", function (c) c:move_to_screen()               end,
    --           {description = "move to screen", group = "client"}),

    -- Retain Window Focus Between Desktops
    awful.key({ modkey,           }, "j", function (c)
      awful.client.focus.global_bydirection("down")
      c:lower()
    end,
    {description = "focus next window up", group = "client"}),
    awful.key({ modkey,           }, "k", function (c)
      awful.client.focus.global_bydirection("up")
      c:lower()
    end,
    {description = "focus next window down", group = "client"}),
    awful.key({ modkey,           }, "l", function (c)
      awful.client.focus.global_bydirection("right")
      c:lower()
    end,
    {description = "focus next window right", group = "client"}),
    awful.key({ modkey,           }, "h", function (c)
      awful.client.focus.global_bydirection("left")
      c:lower()
    end,
    {description = "focus next window left", group = "client"}),

    -- Retain Window Position Between Desktops
    awful.key({ modkey, "Shift"   }, "h", function (c)
      awful.client.swap.global_bydirection("left")
      c:raise()
    end,
    {description = "swap with left client", group = "client"}),
    awful.key({ modkey, "Shift"   }, "l", function (c)
      awful.client.swap.global_bydirection("right")
      c:raise()
    end,
    {description = "swap with right client", group = "client"}),
    awful.key({ modkey, "Shift"   }, "j", function (c)
      awful.client.swap.global_bydirection("down")
      c:raise()
    end,
    {description = "swap with down client", group = "client"}),
    awful.key({ modkey, "Shift"   }, "k", function (c)
      awful.client.swap.global_bydirection("up")
      c:raise()
    end,
    {description = "swap with up client", group = "client"})


  )

  return clientkeys
end

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

return setmetatable({}, {
  __call = function(_, ...) return _M.get(...) end
})
