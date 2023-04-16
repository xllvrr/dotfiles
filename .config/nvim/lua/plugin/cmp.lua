local cmp = require('cmp')
local get_servers = require('mason-lspconfig').get_installed_servers

cmp.setup({
snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
    },
    mapping = {
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<Tab>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        ['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'neorg' },
        { name = 'luasnip' },
        { name = 'buffer',
            option = {
                -- Get Completion from Visible Buffers
                get_bufnrs = function()
                    local bufs = {}
                    for _, win in ipairs(vim.api.nvim_list_wins()) do
                        bufs[vim.api.nvim_win_get_buf(win)] = true
                    end
                    return vim.tbl_keys(bufs)
                end
            }},
    },
    completion = {
        completeopt = 'menu,menuone,noselect',
    },
})

