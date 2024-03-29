-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/xllvr/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?.lua;/home/xllvr/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?/init.lua;/home/xllvr/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?.lua;/home/xllvr/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/xllvr/.cache/nvim/packer_hererocks/2.0.5/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["LaTeX-Box"] = {
    loaded = true,
    path = "/home/xllvr/.local/share/nvim/site/pack/packer/start/LaTeX-Box"
  },
  ["Nvim-R"] = {
    loaded = true,
    path = "/home/xllvr/.local/share/nvim/site/pack/packer/start/Nvim-R"
  },
  ["R-Vim-runtime"] = {
    loaded = true,
    path = "/home/xllvr/.local/share/nvim/site/pack/packer/start/R-Vim-runtime"
  },
  ["auto-pairs"] = {
    loaded = true,
    path = "/home/xllvr/.local/share/nvim/site/pack/packer/start/auto-pairs"
  },
  ["coc.nvim"] = {
    loaded = true,
    path = "/home/xllvr/.local/share/nvim/site/pack/packer/start/coc.nvim"
  },
  ["csv.vim"] = {
    loaded = true,
    path = "/home/xllvr/.local/share/nvim/site/pack/packer/start/csv.vim"
  },
  ["fcitx.vim"] = {
    loaded = true,
    path = "/home/xllvr/.local/share/nvim/site/pack/packer/start/fcitx.vim"
  },
  neoformat = {
    loaded = true,
    path = "/home/xllvr/.local/share/nvim/site/pack/packer/start/neoformat"
  },
  ["nvim-ipy"] = {
    loaded = true,
    path = "/home/xllvr/.local/share/nvim/site/pack/packer/start/nvim-ipy"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/xllvr/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["quick-scope"] = {
    loaded = true,
    path = "/home/xllvr/.local/share/nvim/site/pack/packer/start/quick-scope"
  },
  semshi = {
    commands = { "UpdateRemotePlugins" },
    loaded = false,
    needs_bufread = false,
    path = "/home/xllvr/.local/share/nvim/site/pack/packer/opt/semshi"
  },
  supertab = {
    loaded = true,
    path = "/home/xllvr/.local/share/nvim/site/pack/packer/start/supertab"
  },
  ["sxhkd-vim"] = {
    loaded = true,
    path = "/home/xllvr/.local/share/nvim/site/pack/packer/start/sxhkd-vim"
  },
  ["typescript-vim"] = {
    loaded = true,
    path = "/home/xllvr/.local/share/nvim/site/pack/packer/start/typescript-vim"
  },
  ["vim-airline"] = {
    loaded = true,
    path = "/home/xllvr/.local/share/nvim/site/pack/packer/start/vim-airline"
  },
  ["vim-airline-themes"] = {
    loaded = true,
    path = "/home/xllvr/.local/share/nvim/site/pack/packer/start/vim-airline-themes"
  },
  ["vim-code-dark"] = {
    loaded = true,
    path = "/home/xllvr/.local/share/nvim/site/pack/packer/start/vim-code-dark"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/home/xllvr/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-graphql"] = {
    loaded = true,
    path = "/home/xllvr/.local/share/nvim/site/pack/packer/start/vim-graphql"
  },
  ["vim-highlightedyank"] = {
    loaded = true,
    path = "/home/xllvr/.local/share/nvim/site/pack/packer/start/vim-highlightedyank"
  },
  ["vim-javascript"] = {
    loaded = true,
    path = "/home/xllvr/.local/share/nvim/site/pack/packer/start/vim-javascript"
  },
  ["vim-jsx-pretty"] = {
    loaded = true,
    path = "/home/xllvr/.local/share/nvim/site/pack/packer/start/vim-jsx-pretty"
  },
  ["vim-multiple-cursors"] = {
    loaded = true,
    path = "/home/xllvr/.local/share/nvim/site/pack/packer/start/vim-multiple-cursors"
  },
  ["vim-noh"] = {
    loaded = true,
    path = "/home/xllvr/.local/share/nvim/site/pack/packer/start/vim-noh"
  },
  ["vim-virtualenv"] = {
    loaded = true,
    path = "/home/xllvr/.local/share/nvim/site/pack/packer/start/vim-virtualenv"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/home/xllvr/.local/share/nvim/site/pack/packer/start/vim-vsnip"
  },
  vimwiki = {
    loaded = true,
    path = "/home/xllvr/.local/share/nvim/site/pack/packer/start/vimwiki"
  }
}

time([[Defining packer_plugins]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file UpdateRemotePlugins lua require("packer.load")({'semshi'}, { cmd = "UpdateRemotePlugins", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
