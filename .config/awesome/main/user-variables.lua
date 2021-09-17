local home = os.getenv("HOME")

local _M = {
  -- This is used later as the default terminal and editor to run.
  terminal = "alacritty",
   
  -- Default modkey.
  modkey = "Mod4",

  -- Default browser
  browser = "firefox",

  -- user defined wallpaper
  wallpaper = home .. ".config/wall.jpg",
}

return _M
