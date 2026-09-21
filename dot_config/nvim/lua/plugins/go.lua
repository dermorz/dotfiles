return {
  -- Go LSP and tools
  {
    "ray-x/go.nvim",
    dependencies = {
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup({
        lsp_cfg = true,
        lsp_gofumpt = true,
        lsp_on_attach = function(client, bufnr)
          local opts = { noremap = true, silent = true, buffer = bufnr }
          
          -- Navigation
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          
          -- Refactoring
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
          
          -- Diagnostics
          vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
          vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
          vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
          
          -- Formatting
          vim.keymap.set("n", "<leader>f", function()
            vim.lsp.buf.format({ async = true })
          end, opts)
        end,
        go = "go",
        gofmt = "gofumpt",
        golint = "golint",
        goimports = "goimports",
        gopls = "gopls",
        fillstruct = "fillstruct",
        gomodifytags = "gomodifytags",
        gotests = "gotests",
        impl = "impl",
        iferr = "iferr",
        verbose_commands = true,
        run_in_floating_term = true,
        floating_win_size = 0.8,
        textobjs = {
          select = "gS",
          swap_next = "gsn",
          swap_prev = "gsp",
        },
        build_tags = "tag1,tag2",
        build_flags = "",
        icons = { breakpoint = "🧘", currentpos = "🏃" },
        diagnostic = {
          highlight = true,
          underline = true,
          virtual_text = true,
          signs = true,
          update_in_insert = false,
        },
      })
      
      -- Go tools keymaps
      vim.keymap.set("n", "<leader>gc", "<cmd>GoCmt<cr>", { desc = "Generate Comment" })
      vim.keymap.set("n", "<leader>gt", "<cmd>GoAddTag<cr>", { desc = "Add Tag" })
      vim.keymap.set("n", "<leader>gr", "<cmd>GoRun<cr>", { desc = "Run Go File" })
      vim.keymap.set("n", "<leader>gb", "<cmd>GoBuild<cr>", { desc = "Build Go File" })
      vim.keymap.set("n", "<leader>gi", "<cmd>GoInstall<cr>", { desc = "Install Go Package" })
      vim.keymap.set("n", "<leader>ge", "<cmd>GoIfErr<cr>", { desc = "Add If Err" })
      vim.keymap.set("n", "<leader>gs", "<cmd>GoFillStruct<cr>", { desc = "Fill Struct" })
      vim.keymap.set("n", "<leader>ga", "<cmd>GoAlt<cr>", { desc = "Toggle Alt File" })
    end,
  },
  
  -- DAP core
  {
    "mfussenegger/nvim-dap",
    config = function()
      -- Sign configuration
      vim.fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "", linehl = "", numhl = "" })
      vim.fn.sign_define("DapBreakpointCondition", { text = "🚦", texthl = "", linehl = "", numhl = "" })
      vim.fn.sign_define("DapLogPoint", { text = "📝", texthl = "", linehl = "", numhl = "" })
      vim.fn.sign_define("DapStopped", { text = "🏃", texthl = "", linehl = "", numhl = "" })
    end,
  },
  
  -- DAP UI
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { 
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      require("dapui").setup()
      
      -- Auto open DAP UI on debug start
      local dap, dapui = require("dap"), require("dapui")
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
    end,
  },
  
  -- Go debugging with Delve
  {
    "leoluz/nvim-dap-go",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function()
      require("dap-go").setup()
      
      -- Debugging keymaps
      vim.keymap.set("n", "<leader>db", "<cmd>lua require('dap').toggle_breakpoint()<cr>", { desc = "Toggle Breakpoint" })
      vim.keymap.set("n", "<leader>dc", "<cmd>lua require('dap').continue()<cr>", { desc = "Continue" })
      vim.keymap.set("n", "<leader>do", "<cmd>lua require('dap').step_over()<cr>", { desc = "Step Over" })
      vim.keymap.set("n", "<leader>di", "<cmd>lua require('dap').step_into()<cr>", { desc = "Step Into" })
      vim.keymap.set("n", "<leader>dO", "<cmd>lua require('dap').step_out()<cr>", { desc = "Step Out" })
      vim.keymap.set("n", "<leader>dr", "<cmd>lua require('dap').repl.open()<cr>", { desc = "Open REPL" })
      vim.keymap.set("n", "<leader>dl", "<cmd>lua require('dap').run_last()<cr>", { desc = "Run Last" })
      vim.keymap.set("n", "<leader>du", "<cmd>lua require('dapui').toggle()<cr>", { desc = "Toggle DAP UI" })
    end,
  },
  
  -- Go testing
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "fredrikaverpil/neotest-golang",
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-golang")({
            go_test_args = { "-v", "-race", "-count=1" },
            go_list_args = { "-json" },
            dap_go_opts = {
              delve = {
                build_flags = "",
                initialize_timeout_sec = 20,
                port = "${port}",
                args = {},
                detached = false,
              },
            },
          }),
        },
      })
      
      -- Testing keymaps
      vim.keymap.set("n", "<leader>tt", "<cmd>lua require('neotest').run.run()<cr>", { desc = "Run Nearest Test" })
      vim.keymap.set("n", "<leader>tf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", { desc = "Run File Tests" })
      vim.keymap.set("n", "<leader>ts", "<cmd>lua require('neotest').summary.toggle()<cr>", { desc = "Toggle Test Summary" })
      vim.keymap.set("n", "<leader>to", "<cmd>lua require('neotest').output.open({ enter = true })<cr>", { desc = "Show Test Output" })
      vim.keymap.set("n", "<leader>td", "<cmd>lua require('neotest').run.run({ strategy = 'dap' })<cr>", { desc = "Debug Nearest Test" })
    end,
  },
  
  
}
