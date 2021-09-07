local vim = vim
local fn = vim.fn

-- initialize paq
local install_path = fn.stdpath('data')..'/site/pack/paqs/opt/paq-nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    vim.cmd('!git clone --depth=1 https://github.com/savq/paq-nvim '..install_path)
end
vim.cmd('packadd paq-nvim')
vim.cmd('autocmd BufWritePost packages.lua PaqSync')
require "paq" {
    {'savq/paq-nvim', opt = true };

    -- lib
    'nvim-lua/plenary.nvim';
    'nvim-lua/popup.nvim';

    -- colorscheme
    'sainnhe/gruvbox-material';

    -- lualine
    'hoob3rt/lualine.nvim';
    'kyazdani42/nvim-web-devicons';

    -- fuzzy finder
    'nvim-telescope/telescope.nvim';

    -- code
    {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' };
    'nvim-treesitter/playground';
    'nvim-treesitter/nvim-treesitter-textobjects';

    -- git
    'tanvirtin/vgit.nvim';

    -- lsp
    'neovim/nvim-lspconfig';

    -- go
    'ray-x/go.nvim';

    -- markdown
    {'iamcco/markdown-preview.nvim', run = ':call mkdp#util#install()'};

    -- completion
    'hrsh7th/nvim-compe';
    'L3MON4D3/LuaSnip';

    -- vim stuff
    'tpope/vim-commentary';
    'tpope/vim-repeat';
    'tpope/vim-sleuth';
    'tpope/vim-surround';
    'christoomey/vim-sort-motion';

    -- vimwiki
    'vimwiki/vimwiki';
}
