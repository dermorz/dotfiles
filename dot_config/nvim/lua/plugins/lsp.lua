return {
  -- Core LSP configuration (using built-in vim.lsp.config)
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "cmp-nvim-lsp", -- LSP completion source
      "nvim-lua/plenary.nvim", -- Required for file operations
    },
    config = function()
      -- Load LSP configurations
      require("config.lsp")
    end,
  },
  
  -- Mason for automatic LSP server installation
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
}