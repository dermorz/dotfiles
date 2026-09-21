-- General keymaps
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", { desc = "Write file" })

-- Commands for GTK CSS support (now using cssls)
vim.api.nvim_create_user_command('CheckGTKSupport', function()
  local ft = vim.bo.filetype
  if ft == 'css.gtk' then
    vim.notify('GTK CSS support enabled (using cssls with @define-color support)')
  else
    vim.notify('Standard CSS mode')
  end
end, { desc = 'Check GTK CSS support status' })

-- Key mapping to check GTK CSS support
vim.keymap.set('n', '<leader>cg', ':CheckGTKSupport<CR>', { desc = 'Check GTK CSS support' })

-- Copilot keymaps
vim.keymap.set('n', '<leader>ce', ':CopilotStart<CR>', { desc = 'Enable Copilot' })
vim.keymap.set('n', '<leader>cd', ':CopilotStop<CR>', { desc = 'Disable Copilot' })
vim.keymap.set('n', '<leader>cs', ':Copilot status<CR>', { desc = 'Show Copilot status' })