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



function M.set_keymap(mode, from, to)
    local opts = { noremap = true, silent = true }
    vim.api.nvim_set_keymap(mode, from, to, opts)
    vim.api.nvim_set_keymap("i", "<C-d>f", "compe#scroll({ 'delta': -4 })", { expr = true, noremap = true, silent = true, })
end

