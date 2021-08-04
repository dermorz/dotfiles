local cmd = vim.cmd

-- `chezmoi --apply` whenever a managed dotfile is saved
cmd("autocmd BufWritePost ~/.local/share/chezmoi/* silent ! chezmoi apply --source-path %")
