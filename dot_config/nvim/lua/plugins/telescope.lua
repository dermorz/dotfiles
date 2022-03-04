local set_keymap = require('common').set_keymap

set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
set_keymap('n', '<leader>fF', '<cmd>Telescope find_files hidden=true<cr>')
set_keymap('n', '<leader>rg', '<cmd>Telescope live_grep<cr>')
set_keymap('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
set_keymap('n', '<leader>fh', '<cmd>Telescope help_tags<cr>')
set_keymap('n', '<leader>fr', '<cmd>Telescope registers<cr>')
set_keymap('n', '<leader>gs', '<cmd>Telescope git_status<cr>')
set_keymap('n', '<leader>fm', '<cmd>Telescope marks<cr>')
