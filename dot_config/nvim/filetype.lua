-- Custom filetype detection for GTK CSS
vim.filetype.add({
  extension = {
    css = function(path, bufnr)
      -- Check if file exists and is readable
      if vim.fn.filereadable(path) == 0 then
        return 'css'
      end
      
      -- Check file content for GTK CSS patterns
      local content = vim.fn.join(vim.fn.readfile(path), '\n')
      if content:match('@define%-color') or 
         content:match('@import.*theme') or
         content:match('%-gtk%-') then
        return 'css.gtk'
      end
      
      -- Check file patterns for GTK CSS
      local gtk_patterns = {
        'gtk%.css$', 'gtk%-%d%.css$', '%.gtk%.css$', 
        'theme%.css$', 'colors%.css$', 'adwaita%.css$'
      }
      
      local filename = vim.fn.fnamemodify(path, ':t')
      for _, pattern in ipairs(gtk_patterns) do
        if filename:match(pattern) then
          return 'css.gtk'
        end
      end
      
      return 'css'
    end,
  },
})