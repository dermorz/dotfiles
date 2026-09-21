require("config.lazy")
require("config.keymaps")
require("config.lsp")

-- Load filetype detection for GTK CSS
vim.cmd('runtime filetype.lua')

-- Enhanced GTK CSS filetype detection
vim.filetype.add({
  extension = {
    css = function(path, bufnr)
      -- Check file content for GTK CSS patterns
      if vim.fn.filereadable(path) == 1 then
        local content = vim.fn.join(vim.fn.readfile(path), '\n')
        if content:match('@define%-color') or 
           content:match('@import.*theme') or
           content:match('%-gtk%-') then
          return 'css.gtk'
        end
      end
      
      -- Check file patterns for GTK CSS
      local gtk_patterns = {
        'waybar', 'gtk', 'theme', 'colors', 'adwaita'
      }
      
      local filename = path:lower()
      for _, pattern in ipairs(gtk_patterns) do
        if filename:find(pattern) then
          return 'css.gtk'
        end
      end
      
      return 'css'
    end,
  },
})

-- Enable emoji rendering in neovim
vim.opt.emoji = true
vim.opt.termguicolors = true
