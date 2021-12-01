-- cmp
local cmp = require'cmp'
cmp.setup {
    snippet = {
        expand = function(args)
            vim.fn["UltiSnips#Anon"](args.body)
        end,
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'buffer' },
    })


}

-- snippets
require("luasnip.loaders.from_vscode").lazy_load()
