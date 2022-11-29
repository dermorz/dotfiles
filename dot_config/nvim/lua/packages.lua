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

    -- general code
    {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' };
    'nvim-treesitter/playground';
    'nvim-treesitter/nvim-treesitter-textobjects';
    'junegunn/vim-easy-align';
    'mfussenegger/nvim-dap';

    -- git
    'lewis6991/gitsigns.nvim';

    -- lsp
    'neovim/nvim-lspconfig';
    'nvim-lua/lsp-status.nvim';

    -- go
    'ray-x/go.nvim';
    'leoluz/nvim-dap-go';

    -- markdown
    {'iamcco/markdown-preview.nvim', run = ':call mkdp#util#install()'};
    'ixru/nvim-markdown';

    -- terraforml
    'hashivim/vim-terraform';

    -- completion
    -- 'hrsh7th/nvim-compe';
    'hrsh7th/cmp-nvim-lsp';
    'hrsh7th/cmp-buffer';
    'hrsh7th/cmp-path';
    'hrsh7th/cmp-cmdline';
    'hrsh7th/cmp-calc';
    'hrsh7th/cmp-emoji';

    'hrsh7th/nvim-cmp';

    'L3MON4D3/LuaSnip';
    'saadparwaiz1/cmp_luasnip';
    'rafamadriz/friendly-snippets';

    'onsails/lspkind-nvim';

    -- vim stuff
    'tpope/vim-commentary';
    'tpope/vim-repeat';
    'tpope/vim-sleuth';
    'tpope/vim-surround';
    'christoomey/vim-sort-motion';
    'simnalamburt/vim-mundo';

    -- vimwiki
    'vimwiki/vimwiki';

    -- -- himalaya (mail)
    -- 'soywod/himalaya';
}
