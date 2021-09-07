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

local nvim_set_keymap = require('common').nvim_set_keymap
vim.api.nvim_set_keymap("i", "<C-d>f", "compe#scroll({ 'delta': -4 })", { expr = true, noremap = true, silent = true, })

function imap(from, to)
    local opts = { expr = true, noremap = true, silent = true, }
    nvim_set_keymap("i", from, to, opts)
end

imap("<C-Space>", "compe#complete()")
imap("<CR>", "compe#confirm('<CR>')")
imap("<C-e>", "compe#close('<C-e>')")
