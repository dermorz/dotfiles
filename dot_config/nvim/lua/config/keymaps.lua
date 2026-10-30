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

-- Soft wrapping for prose (used by aerc and qutebrowser editor commands)
vim.api.nvim_create_user_command('SoftWrap', function()
  vim.wo.wrap = true
  vim.wo.linebreak = true
  vim.wo.showbreak = '+++'
  for _, key in ipairs({ 'j', 'k', '0', '$' }) do
    vim.keymap.set('', key, 'g' .. key, { buffer = true })
  end
end, { desc = 'Activate smart softwrapping of text' })

-- Key mapping to check GTK CSS support
vim.keymap.set('n', '<leader>cg', ':CheckGTKSupport<CR>', { desc = 'Check GTK CSS support' })

-- Copilot keymaps
vim.keymap.set('n', '<leader>ce', ':CopilotStart<CR>', { desc = 'Enable Copilot' })
vim.keymap.set('n', '<leader>cd', ':CopilotStop<CR>', { desc = 'Disable Copilot' })
vim.keymap.set('n', '<leader>cs', ':Copilot status<CR>', { desc = 'Show Copilot status' })