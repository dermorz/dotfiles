local cmd = vim.cmd

-- `chezmoi --apply` whenever a managed dotfile is saved
cmd("au BufWritePost ~/.local/share/chezmoi/* silent ! chezmoi apply --source-path %")

-- remove trailint whitespace
cmd("au FileType go,python,lua,c,cpp au BufWritePre <buffer> :%s/\\s\\+$//e")

-- insert mode in term://
cmd("au TermOpen * startinsert")
