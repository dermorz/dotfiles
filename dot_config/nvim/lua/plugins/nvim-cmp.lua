-- cmp
local cmp = require'cmp'
local lspkind = require'lspkind'
cmp.setup {
    snippet = {
        expand = function(args)
            vim.fn["UltiSnips#Anon"](args.body)
        end,
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'emoji' },
        { name = 'path' },
        { name = 'cmdline' },
        { name = 'calc' },
        { name = 'luasnip' },
    }),
    formatting = {
        format = lspkind.cmp_format({
            with_text = false,
            menu = ({
                buffer = "[Buffer]",
                nvim_lsp = "[LSP]",
                luasnip = "[LuaSnip]",
                path = "[Path]",
            })
        })
    },
}


-- snippets
require("luasnip.loaders.from_vscode").lazy_load()