-- compe
require 'compe'.setup {
    source = {
        path = true;
        buffer = true;
        tags = true;
        spell = true;
        calc = true;
        nvim_lsp = true;
        nvim_lua = true;
        ultisnips = true;
        emoji = true;
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

local function prequire(...)
local status, lib = pcall(require, ...)
if (status) then return lib end
    return nil
end

-- luasnip
local luasnip = prequire('luasnip')

local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

_G.tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t "<C-n>"
    elseif luasnip and luasnip.expand_or_jumpable() then
        return t "<Plug>luasnip-expand-or-jump"
    elseif check_back_space() then
        return t "<Tab>"
    else
        return vim.fn['compe#complete']()
    end
end
_G.s_tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t "<C-p>"
    elseif luasnip and luasnip.jumpable(-1) then
        return t "<Plug>luasnip-jump-prev"
    else
        return t "<S-Tab>"
    end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<C-E>", "<Plug>luasnip-next-choice", {})
vim.api.nvim_set_keymap("s", "<C-E>", "<Plug>luasnip-next-choice", {})

-- snippets
require("luasnip.loaders.from_vscode").lazy_load()
