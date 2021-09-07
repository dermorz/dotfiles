require 'compe'.setup {
    source = {
        path = true;
        buffer = true;
        tags = true;
        spell = true;
        calc = true;
        nvim_lsp = true;
        nvim_lua = true;
    }
}

vim.api.nvim_set_keymap("i", "<C-d>f", "compe#scroll({ 'delta': -4 })", { expr = true, noremap = true, silent = true, })
