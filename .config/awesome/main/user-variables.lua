local home = os.getenv("HOME")

local _M = {
  -- This is used later as the default terminal and editor to run.
  terminal = "alacritty",

  -- Default editor
  editor = "nvim",
  
  -- Default file manager
  filemanager = "pcmanfm",

  -- Default modkey.
  modkey = "Mod4",

  -- Default browser
  browser = "chromium",

  -- user defined wallpaper
  -- wallpaper = home .. ".config/wall.png",
}

return _M
