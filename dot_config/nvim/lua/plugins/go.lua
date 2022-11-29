-- rax-x/go.nvim
local cmd = vim.cmd

require('go').setup{
    goimport='gopls',
    gofmt='gopls',
    comment_placeholder='',
}

cmd("autocmd BufWritePre *.go silent! lua require('go.format').goimport()")

-- leoluz/nvim-dap-go
require('dap-go').setup()
