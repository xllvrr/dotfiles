-- Standard awesome library
local awful     = require("awful")
-- Theme handling library
local beautiful = require("beautiful")

local _M = {}

-- reading
-- https://awesomewm.org/apidoc/libraries/awful.rules.html

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

autorun = true
autorunApps =
{
    "safeeyes",
    "fcitx",
    "xrdb ~/.Xresources",
    "compton -b -i 1",
    "Thunderbird",
    "syncthing",
    "machineconf",
    "redshift",
    "/usr/lib/geoclue-2.0/demos/agent"
}

if autorun then
    for app = 1, #autorunApps do
        awful.spawn(autorunApps[app])
    end
end
