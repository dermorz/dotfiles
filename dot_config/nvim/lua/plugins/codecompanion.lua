return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("codecompanion").setup({
      adapters = {
        http = {
          -- Groq (Fast, free tier with generous limits)
          groq = function()
            return require("codecompanion.adapters").extend("openai_compatible", {
              env = {
                url = "https://api.groq.com/openai/v1",
                api_key = "GROQ_API_KEY",
              },
              schema = {
                model = {
                  default = "llama-3.1-8b-instant",
                  choices = {
                    "llama-3.1-8b-instant",
                    "llama-3.1-70b-versatile",
                    "mixtral-8x7b-32768",
                    "gemma2-9b-it",
                  },
                },
              },
            })
          end,

          -- OpenRouter (Access to many free models)
          openrouter = function()
            return require("codecompanion.adapters").extend("openai_compatible", {
              env = {
                url = "https://openrouter.ai/api/v1",
                api_key = "OPENROUTER_API_KEY",
              },
              schema = {
                model = {
                  default = "meta-llama/llama-3.1-8b-instruct:free",
                  choices = {
                    "meta-llama/llama-3.1-8b-instruct:free",
                    "meta-llama/llama-3.2-3b-instruct:free",
                    "microsoft/phi-3-medium-128k-instruct:free",
                    "meta-llama/llama-3.1-70b-instruct:free",
                    "qwen/qwen-2.5-7b-instruct:free",
                    "google/gemma-2-9b-it:free",
                  },
                },
              },
            })
          end,

          -- HuggingFace (Free inference for many models)
          huggingface = function()
            return require("codecompanion.adapters").extend("openai_compatible", {
              env = {
                url = "https://api-inference.huggingface.co/models",
                api_key = "HUGGINGFACE_API_KEY",
              },
              schema = {
                model = {
                  default = "microsoft/DialoGPT-medium",
                  choices = {
                    "microsoft/DialoGPT-medium",
                    "HuggingFaceH4/zephyr-7b-beta",
                    "mistralai/Mistral-7B-Instruct-v0.1",
                    "TinyLlama/TinyLlama-1.1B-Chat-v1.0",
                  },
                },
              },
            })
          end,

          -- Local Ollama (if you want to run local models)
          ollama = function()
            return require("codecompanion.adapters").extend("ollama", {
              env = {
                url = "http://localhost:11434",
              },
              schema = {
                model = {
                  default = "llama3.1:8b",
                  choices = {
                    "llama3.1:8b",
                    "llama3.1:70b",
                    "qwen2.5:7b",
                    "gemma2:9b",
                    "codellama:7b",
                  },
                },
              },
            })
          end,
        },
      },

      -- Set default adapters for different interactions
      interactions = {
        chat = {
          adapter = "groq", -- Start with Groq (fast and reliable)
          keymaps = {
            send = {
              modes = { n = "<C-s>", i = "<C-s>" },
            },
            close = {
              modes = { n = "<C-c>", i = "<C-c>" },
            },
            -- Add adapter switching keymap
            change_adapter = {
              modes = { n = "ga" },
              description = "Change adapter",
            },
          },
          tools = {
            ["cmd_runner"] = {
              opts = {
                require_approval_before = false,
              },
            },
            ["full_stack_dev"] = {
              description = "Access to coding tools",
              prompt = "I'm giving you access to the ${tools} to help you perform coding tasks",
            },
          },
        },
        inline = {
          adapter = "openrouter", -- Use OpenRouter for inline
        },
        cmd = {
          adapter = "groq",
        },
      },

      -- Display settings
      display = {
        chat = {
          show_settings = true,
          show_token_count = true,
          auto_scroll = true,
        },
        action_palette = {
          provider = "default",
        },
      },

      -- Log level for debugging
      opts = {
        log_level = "ERROR",
      },
    })

    -- Set up keymaps for easy access
    vim.keymap.set({ "n", "v" }, "<LocalLeader>a", "<cmd>CodeCompanionActions<cr>",
      { desc = "CodeCompanion Actions", noremap = true, silent = true })
    vim.keymap.set({ "n", "v" }, "<LocalLeader>c", "<cmd>CodeCompanionChat Toggle<cr>",
      { desc = "Toggle CodeCompanion Chat", noremap = true, silent = true })
    vim.keymap.set("v", "<LocalLeader>g", "<cmd>CodeCompanionChat Add<cr>",
      { desc = "Add selection to chat", noremap = true, silent = true })

    -- Expand 'cc' to 'CodeCompanion' in command line
    vim.cmd([[cab cc CodeCompanion]])
  end,
}