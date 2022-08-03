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
    "fcitx5",
    "xrdb ~/.Xresources",
    "compton -b -i 1",
    "syncthing",
    "machineconf",
    "redshift",
    "/usr/lib/geoclue-2.0/demos/agent",
    "linuxvid",
}

if autorun then
    for app = 1, #autorunApps do
        awful.spawn(autorunApps[app])
    end
end
