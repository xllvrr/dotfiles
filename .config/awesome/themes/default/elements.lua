local gmc = require("themes.gmc")
local awful = require("awful")
awful.util = require("awful.util")

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

if(awesome.hostname == "archmain")
then
    theme.font          = "Jet Brains Mono Medium 13" -- "Tamsyn 10" -- "Sans 8"
    theme.taglist_font  = "Jet Brains Mono Medium 16"
    theme.hotkeys_font  = "Jet Brains Mono Medium 13"
    theme.hotkeys_description_font  = "Jet Brains Mono Medium 13"
    theme.notification_font = "HackNerdFont 11"
    theme.menu_font  = "Jet Brains Mono Medium 16"
else
    theme.font          = "Jet Brains Mono Medium 10" -- "Tamsyn 10" -- "Sans 8"
    theme.taglist_font  = "Jet Brains Mono Medium 13"
    theme.hotkeys_font  = "Jet Brains Mono Medium 10"
    theme.hotkeys_description_font  = "Jet Brains Mono Medium 10"
    theme.notification_font = "HackNerdFont 9"
    theme.menu_font  = "Jet Brains Mono Medium 13"
end

theme.bg_normal     = gmc.color['grey900']     .. "cc"
theme.bg_focus      = gmc.color['red300']    .. "cc"
theme.bg_urgent     = gmc.color['orange900'] .. "cc"
theme.bg_minimize   = gmc.color['grey500']   .. "cc"
theme.bg_systray    = gmc.color['grey700']   .. "cc"

theme.fg_normal     = gmc.color['white']
theme.fg_focus      = gmc.color['white']
theme.fg_urgent     = gmc.color['white']
theme.fg_minimize   = gmc.color['white']

theme.useless_gap   = dpi(7)
theme.border_width  = dpi(3)

theme.border_normal = gmc.color['blue500']   .. "cc"
theme.border_focus  = gmc.color['red300']    .. "cc"
theme.border_marked = gmc.color['orange500'] .. "cc"

theme.taglist_bg_focus = gmc.color['red500'] .. "cc"
--theme.taglist_bg_focus = "png:" .. theme_path .. "misc/copycat-holo/taglist_bg_focus.png"
theme.taglist_fg_focus = gmc.color['white']


-- Generate taglist squares:
local taglist_square_size = dpi(6)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
    taglist_square_size, gmc.color['white']
)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    taglist_square_size, gmc.color['white']
)

