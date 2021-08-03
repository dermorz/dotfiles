local set_keymap = require('common').set_keymap
local nvim_set_keymap = require('common').nvim_set_keymap

vim.g.mapleader = " "

set_keymap('n', '<leader>w', '<cmd>w<cr>')
set_keymap('n', '<leader>/', '<cmd>noh<cr>')
set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')
set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
