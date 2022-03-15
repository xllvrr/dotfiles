-- Standard awesome library
local awful     = require("awful")
-- Theme handling library
local beautiful = require("beautiful")

local _M = {}

-- reading
-- https://awesomewm.org/apidoc/libraries/awful.rules.html

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
function custom_focus_filter(c)
    if global_focus_disable then
        return nil
    end
    return awful.client.focus.filter(c)
end

function _M.get(clientkeys, clientbuttons)
    local rules = {

        -- All clients will match this rule.
    { rule = { },
            properties = {
                border_width = beautiful.border_width,
            border_color = beautiful.border_normal,
            focus     = custom_focus_filter,
            raise     = true,
            keys      = clientkeys,
            buttons   = clientbuttons,
            screen    = awful.screen.preferred,
            placement = awful.placement.no_overlap+awful.placement.no_offscreen,
            maximized_horizontal = false,
            maximized_vertical = false,
            maximized = false,
            }
            },

        -- Floating clients.
    { rule_any = {
            instance = {
                "DTA",  -- Firefox addon DownThemAll.
                "copyq",  -- Includes session name in class.
                "pinentry",
                },
            class = {
                "Arandr",
                "Blueman-manager",
                "Gpick",
                "Gimp",
                "Darktable",
                "Kruler",
                "MessageWin",  -- kalarm.
                "Sxiv",
                "Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
                "Wpa_gui",
                "veromix",
                "xtightvncviewer",
                "calfjackhost",
                "QjackCtl",
                "Pavucontrol",
                "mpv",
            },
            -- Note that the name property shown in xprop might be set slightly after creation of the client
            -- and the name shown there might not match defined rules here.
            name = {
                "Event Tester",  -- xev.
            "VimWiki" -- Vimwiki
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

        -- Map certain applications to certain tags
    { rule = { class = "Thunderbird" },
            properties = { tag = "" }
        },

    { rule = { instance = "discord" },
            properties = { tag = "" }
        },

    { rule = { instance = "zoom" },
            properties = { tag = "" }
        },

    { rule = { class = "Darktable" },
            properties = { tag = "", fullscreen = true }
        },

    { rule = { class = "Gimp" },
            properties = { tag = "", floating = true }
        },

    { rule = { class = "Lutris" },
            properties = { tag = "" }
        },

    }

    return rules
end

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

return setmetatable(
{}, 
{ __call = function(_, ...) return _M.get(...) end }
)
