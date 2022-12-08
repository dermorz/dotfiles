local set_keymap = require('common').set_keymap
local nvim_set_keymap = require('common').nvim_set_keymap

vim.g.mapleader = " "

set_keymap('n', '<leader>w', '<cmd>w<cr>')
set_keymap('n', '<leader>/', '<cmd>noh<cr>')
set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')
set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')
set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')
set_keymap('n', 'grn', '<cmd>lua vim.lsp.buf.rename()<cr>')
set_keymap('n', '<C-j>', '<cmd>cn<cr>')
set_keymap('n', '<C-k>', '<cmd>cp<cr>')
set_keymap('n', 'H', '<cmd>bp<cr>')
set_keymap('n', 'L', '<cmd>bn<cr>')
set_keymap('n', 'ga', '<Plug>(EasyAlign)')

set_keymap('n', '<leader>n', '<cmd>lua vim.diagnostic.goto_next()<cr>')

set_keymap('n', '<leader>db', '<cmd>lua require"dap".toggle_breakpoint()<cr>')
set_keymap('n', '<leader>dc', '<cmd>lua require"dap".continue()<cr>')
set_keymap('n', '<leader>dn', '<cmd>lua require"dap".step_over()<cr>')
set_keymap('n', '<leader>ds', '<cmd>lua require"dap".step_into()<cr>')

set_keymap('t', '<esc>', '<C-\\><C-n>')
