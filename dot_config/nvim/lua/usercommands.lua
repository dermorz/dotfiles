vim.api.nvim_create_user_command(
    'SoftWrap',
    function()
        vim.o.wrap = true
        vim.o.linebreak = true
        vim.o.showbreak = '+++'
        vim.o.textwidth = 0

        local opts = { noremap = true, silent = false }
        vim.api.nvim_buf_set_keymap(0, '', 'j', 'gj', opts)
        vim.api.nvim_buf_set_keymap(0, '', 'k', 'gk', opts)
        vim.api.nvim_buf_set_keymap(0, '', '0', 'g0', opts)
        vim.api.nvim_buf_set_keymap(0, '', '$', 'g$', opts)
    end,
    {bang = false, desc = 'Activate smart softwrapping of text'}
)
