-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
-- local hotkeys_popup = require("awful.hotkeys_popup").widget
local hotkeys_popup = require("awful.hotkeys_popup")

-- Resource Configuration
local modkey = RC.vars.modkey
local terminal = RC.vars.terminal
local browser = RC.vars.browser

local _M = {}

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

function _M.get()
  local globalkeys = gears.table.join(

    -- Awesome Controls
    awful.key({ modkey,           }, "s",      hotkeys_popup.show_help,
              {description="show help", group="awesome"}),
    awful.key({ modkey, "Control" }, "r", awesome.restart,
              {description="reload awesome", group = "awesome"}),
    awful.key({ modkey, "Shift" }, "q", awesome.quit,
              {description="quit awesome", group = "awesome"}),

    -- Tag Browsing
    awful.key({ modkey,           }, "Left",   awful.tag.viewprev,
              {description = "view previous", group = "tag"}),
    awful.key({ modkey,           }, "Right",  awful.tag.viewnext,
              {description = "view next", group = "tag"}),

    -- Master and Column Manipulation
    awful.key({ modkey    }, "m",     function () awful.tag.incnmaster( 1, nil, true) end,
              {description = "increase the number of master clients", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "m",     function () awful.tag.incnmaster(-1, nil, true) end,
              {description = "decrease the number of master clients", group = "layout"}),
    awful.key({ modkey,  }, "n",     function () awful.tag.incncol( 1, nil, true)    end,
              {description = "increase the number of columns", group = "layout"}),
    awful.key({ modkey, "Shift" }, "n",     function () awful.tag.incncol(-1, nil, true)    end,
              {description = "decrease the number of columns", group = "layout"}),

    -- Swap Layout
    awful.key({ modkey, "Mod1"   }, "space", function () awful.layout.inc( 1)                end,
              {description = "select next", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(-1)                end,
              {description = "select previous", group = "layout"}),
              
    -- Standard Programs
    awful.key({ modkey, }, "Return", function () awful.spawn(terminal) end,
              {description="open a terminal", group = "programs"}),
    awful.key({ "Mod1", }, "Space", function () awful.spawn("rofimenu") end,
              {description = "launch rofi", group = "programs"})
    awful.key({ modkey, "a" }, "1", function () awful.spawn(browser) end,
              {description="launch browser", group = "programs"})
    awful.key({ modkey, "a" }, "2", function () awful.spawn("Thunderbird") end,
              {description="launch email", group = "programs"})
    awful.key({ modkey, "a" }, "3", function () awful.spawn(terminal.." -e nvim -c VimWikiIndex") end,
              {description="launch vimwiki", group = "programs"})
    awful.key({ modkey, "a" }, "4", function () awful.spawn("messenger") end,
              {description="launch messenger script", group = "programs"})
    awful.key({ modkey, "a" }, "5", function () awful.spawn("discord") end,
              {description="launch discord", group = "programs"})
    awful.key({ modkey, "a" }, "6", function () awful.spawn("zoom") end,
              {description="launch zoom", group = "programs"})
    awful.key({ modkey, "d" }, "f", function () awful.spawn("pcmanfm") end,
              {description="launch file manager", group = "programs"})
    awful.key({ "Print" }, , function () awful.spawn("maimpick") end,
              {description="screenshot", group = "programs"})

    -- System Options
    awful.key({ modkey, "p" }, "o", function () awful.spawn("systemctl poweroff") end,
              {description="shutdown pc", group = "system"})
    awful.key({ modkey, "p" }, "r", function () awful.spawn("systemctl restart") end,
              {description="restart pc", group = "system"})
    awful.key({ modkey, "p" }, "s", function () awful.spawn("systemctl suspend") end,
              {description="suspend pc", group = "system"})
    awful.key({ modkey, "Mod1" }, "c", function () awful.spawn(terminal.."-e cfglist") end,
              {description="list configurations", group = "system"})
    awful.key({ modkey, "Control" }, "Up", function () awful.spawn("xbacklight -set 100") end,
              {description="set full brightness", group = "system"})
    awful.key({ modkey, "Control" }, "Down", function () awful.spawn("xbacklight -set 0") end,
              {description="set full darkness", group = "system"})
    awful.key({ modkey, "Control" }, "Space", function () awful.spawn("xbacklight -set 50") end,
              {description="set half brightness", group = "system"})

    -- Resize
    awful.key({ modkey, "Mod1" }, "j",  
              function () awful.client.moveresize( 0, 0, 0, -20) end),
    awful.key({ modkey, "Mod1" }, "k",    
              function () awful.client.moveresize( 0, 0, 0,  20) end),
    awful.key({ modkey, "Mod1" }, "h",  
              function () awful.client.moveresize( 0, 0, -20, 0) end),
    awful.key({ modkey, "Mod1" }, "l", 
              function () awful.client.moveresize( 0, 0,  20, 0) end),

    -- Prompt
    awful.key({ modkey, "Control" }, "r",
              function ()
                  awful.prompt.run {
                    prompt       = "Run Lua code: ",
                    textbox      = awful.screen.focused().mypromptbox.widget,
                    exe_callback = awful.util.eval,
                    history_path = awful.util.get_cache_dir() .. "/history_eval"
                  }
              end,
              {description = "lua execute prompt", group = "awesome"}),

  )

  return globalkeys
end

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

return setmetatable({}, { 
  __call = function(_, ...) return _M.get(...) end 
})

