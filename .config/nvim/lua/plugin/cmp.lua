local cmp = require'cmp'

cmp.setup({
snippet = {
        expand = function(args)
            -- For `vsnip` user.
            vim.fn["vsnip#anonymous"](args.body)
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
        { name = 'vsnip' },
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
        completeopt = 'menu,menuone,noinsert',
    },
    formatting = {
        format = require("lspkind").cmp_format({with_text = true, menu = ({
            buffer = "[Buffer]",
            nvim_lsp = "[LSP]",
            nvim_lua = "[Lua]",
            latex_symbols = "[Latex]",
        })}),
    },
})

-- Setup lspconfig.
local servers = { 'pyright', 'tsserver', 'gopls' }

for _, lsp in ipairs(servers) do
    require('lspconfig')[lsp].setup {
        on_attach = on_attach,
        flags = {
            debounce_text_changes = 150
        },
        capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
    }
end

require'lspconfig'.r_language_server.setup{
    on_attach = on_attach,
    flags = {
        debounce_text_changes = 150
    },
    capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
    settings = {
        r = {
            lsp = {
                diagnostics = false
            }
        }
    }
}

-- Disable for Latex and Rnw
vim.cmd([[autocmd FileType rnoweb lua require('cmp').setup.buffer { enabled = false }]])
vim.cmd([[autocmd FileType tex lua require('cmp').setup.buffer { enabled = false }]])
