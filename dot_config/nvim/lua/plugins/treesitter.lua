return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = { 
      "go", 
      "gomod", 
      "gosum", 
      "gowork", 
      "markdown", 
      "markdown_inline",
      "yaml",
      "json",
    },
    auto_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    indent = {
      enable = true,
    },
  },
}