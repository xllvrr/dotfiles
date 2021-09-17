local gmc = require("themes.gmc")

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

theme.font          = "Jet Brains Mono Medium 13" -- "Tamsyn 10" -- "Sans 8"
theme.taglist_font  = "Jet Brains Mono Medium 13"

theme.bg_normal     = gmc.color['white']     .. "cc"
theme.bg_focus      = gmc.color['red300']    .. "cc"
theme.bg_urgent     = gmc.color['orange900'] .. "cc"
theme.bg_minimize   = gmc.color['grey500']   .. "cc"
theme.bg_systray    = gmc.color['grey100']   .. "cc"

theme.fg_normal     = gmc.color['black']
theme.fg_focus      = gmc.color['white']
theme.fg_urgent     = gmc.color['white']
theme.fg_minimize   = gmc.color['white']

theme.useless_gap   = 3
theme.border_width  = 2
beautiful.gap_single_client = true

theme.border_normal = gmc.color['#4c566a']   .. "cc"
theme.border_focus  = gmc.color['#406ea5']    .. "cc"
theme.border_marked = gmc.color['#5e81ac'] .. "cc"

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- Example:

theme.taglist_bg_focus = gmc.color['#222'] .. "cc"
--theme.taglist_bg_focus = "png:" .. theme_path .. "misc/copycat-holo/taglist_bg_focus.png"
theme.taglist_fg_focus = gmc.color['white']

-- Generate taglist squares:
local taglist_square_size = dpi(4)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
    taglist_square_size, gmc.color['black']
)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    taglist_square_size, gmc.color['white']
)
