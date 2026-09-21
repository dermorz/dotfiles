-- GitHub Copilot plugin (loaded but disabled by default)
return {
  "github/copilot.vim",
  config = function()
    -- Disable automatic startup
    vim.g.copilot_assume_mapped = false
    vim.g.copilot_no_tab_map = true
    
    -- Start with Copilot disabled
    vim.cmd('Copilot disable')
    
    -- Create user commands
    vim.api.nvim_create_user_command('CopilotStart', function()
      vim.cmd('Copilot enable')
      vim.notify('Copilot enabled', vim.log.levels.INFO)
    end, { desc = 'Enable Copilot' })
    
    vim.api.nvim_create_user_command('CopilotStop', function()
      vim.cmd('Copilot disable')
      vim.notify('Copilot disabled', vim.log.levels.INFO)
    end, { desc = 'Disable Copilot' })
    
    -- Setup keybindings (only active when Copilot is enabled)
    vim.keymap.set('i', '<C-y>', 'copilot#Accept("\\<CR>")', { 
      expr = true, 
      replace_keycodes = false,
      desc = 'Accept Copilot suggestion'
    })
    vim.keymap.set('i', '<C-n>', 'copilot#Next()', { 
      expr = true, 
      desc = 'Next Copilot suggestion'
    })
    vim.keymap.set('i', '<C-p>', 'copilot#Previous()', { 
      expr = true, 
      desc = 'Previous Copilot suggestion'
    })
    vim.keymap.set('i', '<C-x>', 'copilot#Dismiss()', { 
      expr = true, 
      desc = 'Dismiss Copilot suggestion'
    })
  end,
}