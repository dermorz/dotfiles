require 'vgit'.setup{
    preview = {
    }
}

local set_keymap = require('common').set_keymap

set_keymap('n', '<leader>gd', '<cmd>VGit diff<cr>')
