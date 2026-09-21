-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'
vim.opt.fileencodings = { 'utf-8' }
vim.opt.backup = false -- no .bak
vim.opt.swapfile = false -- no .swap
vim.opt.undofile = true -- use undo file

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.autoindent = true
vim.opt.shiftwidth = 4

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.whichwrap = 'b,s,<,>,[,]' -- cursor is able to move from end of line to next line
vim.opt.backspace = { 'indent', 'eol', 'start' } -- backspace behaviors
vim.opt.listchars = 'eol:¬,tab:  ,trail:~,extends:>,precedes:<,space:·' -- show whitespce characters
vim.opt.list = true -- show tabs with listchars
vim.opt.ignorecase = true -- search with ignore case by default
vim.opt.smartcase = true -- search search case sensitive if search term contains uppercase letter
vim.opt.hlsearch = true -- highlight search
vim.opt.incsearch = true -- incrementally highlight all matches while typing
vim.opt.inccommand = 'nosplit' -- live substitute preview
vim.opt.completeopt = { 'menuone', 'noselect' }
vim.opt.hidden = true
vim.opt.cursorline = true -- show cursor line
vim.opt.ruler = true -- show ruler line
vim.opt.signcolumn = 'yes' -- show sign column (column of the line number)
vim.opt.mouse = 'nv' -- enable mouse under normal and visual mode
vim.cmd('set mousehide') -- hide mouse when characters are typed
vim.opt.showmatch = true -- show bracket match
vim.opt.wildmenu = true -- wildmenu, auto complete for commands
vim.opt.wildmode = { 'longest', 'full' }
vim.opt.splitright = true -- split to right
vim.opt.splitbelow = true -- split to below
vim.opt.shortmess:append('c') -- status line e.g. CTRL+G



vim.cmd('au TextYankPost * lua vim.highlight.on_yank {on_visual = false}')

-- Basic conceal settings
vim.opt.conceallevel = 2
vim.opt.concealcursor = "ncv"

-- Disable conceal for JSON
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "json", "jsonc" },
  callback = function()
    vim.opt.conceallevel = 0
  end,
})

-- Markdown link conceal override
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    -- Use treesitter-based conceal for links
    vim.api.nvim_set_hl(0, "@text.reference.markdown_inline_link", {
      link = "Conceal"
    })
    vim.api.nvim_set_hl(0, "@markup.link.label.markdown_inline", {
      fg = "#61afef",
      underline = true
    })
  end,
})

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    { import = "plugins" },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "gruvbox-material" } },
  -- automatically check for plugin updates once a day
  checker = {
      enabled = true,
      frequency = 86400, -- check every 24 hours
  },
})
