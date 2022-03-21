---- IRON-REPL ----------------------------------------------------------------
local iron = require('iron')

iron.core.add_repl_definitions {
    python = {
        venv_python = {
            command =  "pipenv run ipython"
        }
    }
}

iron.core.set_config {
    preferred = {
        python = "ipython",
    },
    repl_open_cmd = 'rightbelow vertical split'
}

-- Mappings
local map = vim.api.nvim_set_keymap
local options = { noremap = false }
map('v', '<silent><C-v>', '<Plug>(iron-visual-send)', options)
map('n', '<localleader>l', '<Plug>(iron-send-line)', options)
map('', '<localleader>ir', ':IronRepl<CR>', options)
map('', '<localleader>iq', '<Plug>(iron-exit)', options)
map('', '<localleader>ic', '<Plug>(iron-clear)', options)

vim.g.iron_map_extended = 0
