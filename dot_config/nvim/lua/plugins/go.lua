-- rax-x/go.nvim
local cmd = vim.cmd

require('go').setup{
    goimport='goimports',
    comment_placeholder='',
}

cmd("autocmd BufWritePre *.go silent! lua require('go.format').goimport()")
