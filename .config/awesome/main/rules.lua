-- Standard awesome library
local awful     = require("awful")
-- Theme handling library
local beautiful = require("beautiful")

local _M = {}

-- reading
-- https://awesomewm.org/apidoc/libraries/awful.rules.html

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

function _M.get(clientkeys, clientbuttons)
  local rules = {

    -- All clients will match this rule.
    { rule = { },
      properties = {
        border_width = beautiful.border_width,
        border_color = beautiful.border_normal,
        focus     = awful.client.focus.filter,
        raise     = true,
        keys      = clientkeys,
        buttons   = clientbuttons,
        screen    = awful.screen.preferred,
        placement = awful.placement.no_overlap+awful.placement.no_offscreen,
      }
    },

    -- Floating clients.
    { rule_any = {
        -- Note that the name property shown in xprop might be set slightly after creation of the client
        -- and the name shown there might not match defined rules here.
        name = {
          "Event Tester",  -- xev.
        },
        role = {
          "AlarmWindow",  -- Thunderbird's calendar.
          "ConfigManager",  -- Thunderbird's about:config.
          "pop-up",       -- e.g. Google Chrome's (detached) Developer Tools.
        }
      },
      properties = { 
        floating = true 
      }
    },

    -- Set Firefox to always map on the tag named "2" on screen 1.
    -- { rule = { class = "Firefox" },
    --   properties = { screen = 1, tag = "2" } },
    
    { rule = { class = "Thunderbird" },
      properties = { screen = 1, tag = "1" }
    },

    { rule = { class = "discord" },
      properties = { screen = 1, tag = "4" }
    },

    { rule = { class = "zoom" },
      properties = { screen = 1, tag = "5" }
    },

    { rule = { class = "Darktable" },
      properties = { screen = 1, tag = "3", fullscreen = true }
    },

    { rule = { class = "Gimp" },
      properties = { screen = 1, tag = "3", floating = true }
    },

  }

  return rules
end

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

return setmetatable(
  {}, 
  { __call = function(_, ...) return _M.get(...) end }
)
