-- cmp
require 'cmp'.setup {
    snippet = {
        expand = function(args)
            vim.fn["UltiSnips#Anon"](args.body)
        end,
    }


}

-- snippets
require("luasnip.loaders.from_vscode").lazy_load()
