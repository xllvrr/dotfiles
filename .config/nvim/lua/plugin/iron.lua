---- IRON-REPL ----------------------------------------------------------------
local iron = require('iron')

iron.core.setup {
    config = {
        -- Highlights the last sent block with bold
        highlight_last = "IronLastSent",
        -- If iron should expose `<plug>(...)` mappings for the plugins
        should_map_plug = false,
        -- Whether a repl should be discarded or not
        scratch_repl = true,
        -- Automatically closes the repl window on process end
        close_window_on_exit = true,
        -- Your repl definitions come here
        repl_definition = {
            sh = {
                command = { "zsh" }
            },
            python = require("iron.fts.python").ipython
        },
        -- Repl position
        repl_open_cmd = require("iron.view").curry.right(function()
            return math.ceil(vim.o.columns / 2)
        end),
    },
    -- Iron doesn't set keymaps by default anymore. Set them here
    -- or use `should_map_plug = true` and map from you vim files
    keymaps = {
        send_motion = "<space>sc",
        visual_send = "<space>sv",
        send_line = "<space>sl",
        repeat_cmd = "<space>s.",
        cr = "<space>s<cr>",
        interrupt = "<space>s<space>",
        exit = "<space>sq",
        clear = "<space>cl",
    }

}
