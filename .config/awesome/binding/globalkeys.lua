-- Standard awesome library 
local gears = require("gears")
local awful = require("awful")
-- local hotkeys_popup = require("awful.hotkeys_popup").widget
local hotkeys_popup = require("awful.hotkeys_popup")

-- Resource Configuration
local modkey = RC.vars.modkey
local terminal = RC.vars.terminal
local browser = RC.vars.browser
local emailclient = RC.vars.emailclient
local filemanager = RC.vars.filemanager

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
    awful.key({ modkey, "Control"  }, "space", function () awful.layout.inc( 1)                end,
              {description = "select next", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(-1)                end,
              {description = "select previous", group = "layout"}),

    -- Programs
    awful.key({ modkey, }, "Return", function () awful.spawn(terminal) end,
              {description="open a terminal", group = "programs"}),
    awful.key({ "Mod1", }, "space", function () awful.spawn("rofimenu") end,
              {description = "launch rofi", group = "programs"}),
    awful.key({ modkey, }, "b", function () awful.spawn(browser) end,
              {description="launch browser", group = "programs"}),
    awful.key({ modkey, }, "e", function () awful.spawn(emailclient) end,
              {description="launch email", group = "programs"}),
    awful.key({ modkey, }, "g", function () awful.spawn("steam") end,
              {description="launch steam", group = "programs"}),
    awful.key({ modkey, "Mod1" }, "g", function () awful.spawn("lutris") end,
              {description="launch lutris", group = "programs"}),
    awful.key({ modkey, "Shift" }, "w", function () awful.spawn(terminal.." -e nvim -c VimwikiIndex") end,
              {description="launch vimwiki", group = "programs"}),
    awful.key({ modkey, "Mod1" }, "m", function () awful.spawn("messenger") end,
              {description="launch messenger script", group = "programs"}),
    awful.key({ modkey, "Mod1" }, "d", function () awful.spawn("discord") end,
              {description="launch discord", group = "programs"}),
    awful.key({ modkey, "Mod1" }, "f", function () awful.spawn(filemanager) end,
              {description="launch file manager", group = "programs"}),
    awful.key({  }, "Print", function () awful.spawn("maimpick") end,
              {description="screenshot", group = "programs"}),

    -- System Options
    awful.key({ modkey, "Mod1" }, "o", function () awful.spawn("systemctl poweroff") end,
              {description="shutdown pc", group = "system"}),
    awful.key({ modkey, "Mod1" }, "r", function () awful.spawn("systemctl reboot") end,
              {description="restart pc", group = "system"}),
    awful.key({ modkey, "Mod1" }, "s", function () awful.spawn("systemctl suspend") end,
              {description="suspend pc", group = "system"}),
    awful.key({ modkey, "Control" }, "c", function () awful.spawn(terminal.." -e cfglist") end,
              {description="list configurations", group = "system"}),
    awful.key({ modkey, "Control" }, "Up", function () awful.spawn("xbacklight -set 100") end,
              {description="set full brightness", group = "system"}),
    awful.key({ modkey, "Control" }, "Down", function () awful.spawn("xbacklight -set 0") end,
              {description="set full darkness", group = "system"}),
    awful.key({ modkey, "Control" }, "space", function () awful.spawn("xbacklight -set 50") end,
              {description="set half brightness", group = "system"}),
    awful.key({ modkey, "Shift" }, "f", function () global_focus_disable = not global_focus_disable end,
              {description="turn off global focus", group = "system"}),
    awful.key({ modkey, "Shift" }, "a", function() awful.spawn("alsactl init") end,
              {description="reset alsa", group = "system"}),

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
    awful.key({ modkey, "Shift" }, "r",
              function ()
                  awful.prompt.run {
                    prompt       = "Run Lua code: ",
                    textbox      = awful.screen.focused().promptbox.widget,
                    exe_callback = awful.util.eval,
                    history_path = awful.util.get_cache_dir() .. "/history_eval"
                  }
              end,
              {description = "lua execute prompt", group = "awesome"}),

    -- Minimize and Restore Clients
    awful.key({ modkey,           }, "w",
	  function()
	     if cl_menu then
		cl_menu:hide()
		cl_menu=nil
	     else
		client_list={}
		local tag = awful.tag.selected()
		for i=1, #tag:clients() do
		   cl=tag:clients()[i]
		   if tag:clients()[i].minimized then
		      prefix = "_ "
		   else
		      prefix = "* "
		   end
		   if not awful.rules.match(cl, {class= "Conky"}) then
		      client_list[i]=
			 {prefix .. cl.name,
			  function()
			     tag:clients()[i].minimized=not tag:clients()[i].minimized
			  end,
			  cl.icon
			 }
		   end
		end
		cl_menu=awful.menu({items = client_list, theme = {width=300}})
		cl_menu:show()
	     end
	  end,
      {description = "minimize or restore client", group = "client"})
  )

  return globalkeys
end

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

return setmetatable({}, { 
  __call = function(_, ...) return _M.get(...) end 
})

