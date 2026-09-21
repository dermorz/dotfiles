return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup({
      signs = {
        add = { text = "│" },
        change = { text = "│" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "┆" },
      },
      signcolumn = true,
      numhl = false,
      linehl = false,
      word_diff = false,
      watch_gitdir = {
        interval = 1000,
        follow_files = true,
      },
      sign_priority = 6,
      update_debounce = 100,
      status_formatter = nil,
      max_file_length = 40000,
      preview_config = {
        border = "single",
        style = "minimal",
        relative = "cursor",
        row = 0,
        col = 1,
      },
      -- Keymaps for navigation and blame
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        
        -- Navigation
        vim.keymap.set("n", "]c", function()
          if vim.wo.diff then return "]c" end
          vim.schedule(function() gs.next_hunk() end)
          return "<Ignore>"
        end, { buffer = bufnr, expr = true, desc = "Next hunk" })
        
        vim.keymap.set("n", "[c", function()
          if vim.wo.diff then return "[c" end
          vim.schedule(function() gs.prev_hunk() end)
          return "<Ignore>"
        end, { buffer = bufnr, expr = true, desc = "Previous hunk" })
        
        -- Blame
        vim.keymap.set("n", "<leader>gb", "<cmd>Gitsigns blame<cr>", { buffer = bufnr, desc = "Git blame" })
        vim.keymap.set("n", "<leader>gB", "<cmd>Gitsigns blame_line<cr>", { buffer = bufnr, desc = "Git blame line" })
        
        -- Hunk actions (viewing only)
        vim.keymap.set("n", "<leader>hp", "<cmd>Gitsigns preview_hunk<cr>", { buffer = bufnr, desc = "Preview hunk" })
        vim.keymap.set("n", "<leader>hs", "<cmd>Gitsigns show<cr>", { buffer = bufnr, desc = "Show git status" })
        
        -- Reset hunk
        vim.keymap.set("n", "<leader>hr", "<cmd>Gitsigns reset_hunk<cr>", { buffer = bufnr, desc = "Reset hunk" })
        vim.keymap.set("v", "<leader>hr", "<cmd>Gitsigns reset_hunk<cr>", { buffer = bufnr, desc = "Reset hunk" })
      end,
    })
  end,
}