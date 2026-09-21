-- LSP server configurations using vim.lsp.config framework
local capabilities = require('config.capabilities')

-- Common on_attach function for LSP servers
local on_attach = function(client, bufnr)
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
  
  -- Formatting (only if server supports it)
  if client.server_capabilities.documentFormattingProvider then
    vim.keymap.set("n", "<leader>f", function()
      vim.lsp.buf.format({ async = true })
    end, opts)
  end
end

-- Configure YAML Language Server using new vim.lsp.config
vim.lsp.config('yamlls', {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    yaml = {
      -- Schema validation
      schemas = {
        -- Kubernetes schemas
        -- Specific Kubernetes resource schemas to avoid conflicts
        ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.35.0-standalone/deployment-apps-v1.json"] = {
          "*/deployment*.yaml",
          "*/deployment*.yml",
          "deployments/*.yaml",
          "deployments/*.yml"
        },
        ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.35.0-standalone/service-v1.json"] = {
          "*/service*.yaml",
          "*/service*.yml",
          "services/*.yaml",
          "services/*.yml"
        },
        ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.35.0-standalone/configmap-v1.json"] = {
          "*/configmap*.yaml",
          "*/configmap*.yml",
          "configmaps/*.yaml",
          "configmaps/*.yml"
        },
        ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.35.0-standalone/secret-v1.json"] = {
          "*/secret*.yaml",
          "*/secret*.yml",
          "secrets/*.yaml",
          "secrets/*.yml"
        },
        ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.35.0-standalone/ingress-networking-k8s-io-v1.json"] = {
          "*/ingress*.yaml",
          "*/ingress*.yml",
          "ingresses/*.yaml",
          "ingresses/*.yml"
        },
        
        -- Helm schemas
        ["https://json.schemastore.org/chart.json"] = "Chart.yaml",
        ["https://json.schemastore.org/helmfile.json"] = "helmfile.yaml",
        
        -- GitHub Actions
        ["https://json.schemastore.org/github-workflow.json"] = ".github/workflows/*",
        
        -- Docker Compose
        ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = {
          "docker-compose.yml",
          "docker-compose.yaml",
          "docker-compose.*.yml",
          "docker-compose.*.yaml"
        },
        
        -- Open Component Model (OCM)
        ["https://raw.githubusercontent.com/open-component-model/ocm-spec/main/schema/ocm-component.json"] = {
          "component-descriptor.yaml",
          "component-descriptor.yml"
        },
        
        -- General configurations
        ["https://json.schemastore.org/circleciconfig.json"] = ".circleci/config.yml",
        ["https://json.schemastore.org/gitlab-ci"] = ".gitlab-ci.yml",
        ["https://json.schemastore.org/ansible-playbook.json"] = "*.ansible.yml",
        ["https://json.schemastore.org/pre-commit-config.json"] = ".pre-commit-config.yaml"
      },
      
      -- Validation settings
      validate = true,
      hover = true,
      completion = true,
      format = {
        enable = false -- Disable built-in formatting, let user manage it
      },

      schemaStore = {
        enable = true,
        url = "https://www.schemastore.org/api/json/catalog.json"
      },

      yamlJSONSchemas = {
        ["https://json.schemastore.org/kustomization.json"] = "kustomization.yaml",
        ["https://json.schemastore.org/kustomization.json"] = "kustomization.yml",
        ["https://json.schemastore.org/helmfile.json"] = "helmfile.yaml",
        ["https://json.schemastore.org/helmfile.json"] = "helmfile.yml",
      },
      
      customTags = {
        "!fn",
        "!env", 
        "!vault"
      }
    }
  },
  
  -- File patterns to trigger the LSP
  filetypes = {
    "yaml",
    "yaml.ansible", 
    "yaml.docker-compose",
    "yaml.fhir",
    "yml"
  }
})

-- Configure CSS Language Server using new vim.lsp.config
vim.lsp.config('cssls', {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    css = {
      validate = true,
      lint = {
        unknownAtRules = "ignore",
        important = "warning",
        duplicateProperties = "warning",
        emptyRules = "warning",
        selectorClassPattern = "^.[a-zA-Z][a-zA-Z0-9_-]*$",
        zeroUnits = "warning"
      }
    },
    less = {
      validate = true,
      lint = {
        unknownAtRules = "ignore",
        important = "warning",
        duplicateProperties = "warning",
        emptyRules = "warning",
        selectorClassPattern = "^.[a-zA-Z][a-zA-Z0-9_-]*$",
        zeroUnits = "warning"
      }
    },
    scss = {
      validate = true,
      lint = {
        unknownAtRules = "ignore",
        important = "warning",
        duplicateProperties = "warning",
        emptyRules = "warning",
        selectorClassPattern = "^.[a-zA-Z][a-zA-Z0-9_-]*$",
        zeroUnits = "warning"
      }
    }
  },
  filetypes = {
    "css",
    "less",
    "scss",
    "sass"
  }
})

-- Enable yamlls server
vim.lsp.enable('yamlls')

-- Configure CSS Language Server with GTK support
vim.lsp.config('cssls', {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    css = {
      validate = true,
      lint = {
        unknownAtRules = "ignore",
        important = "warning",
        duplicateProperties = "warning",
        emptyRules = "warning",
        selectorClassPattern = "^.[a-zA-Z][a-zA-Z0-9_-]*$",
        zeroUnits = "warning"
      },
      -- Note: GTK CSS @define-color support will be handled through file type settings
    },
    less = {
      validate = true,
      lint = {
        unknownAtRules = "ignore",
        important = "warning",
        duplicateProperties = "warning",
        emptyRules = "warning",
        selectorClassPattern = "^.[a-zA-Z][a-zA-Z0-9_-]*$",
        zeroUnits = "warning"
      }
    },
    scss = {
      validate = true,
      lint = {
        unknownAtRules = "ignore",
        important = "warning",
        duplicateProperties = "warning",
        emptyRules = "warning",
        selectorClassPattern = "^.[a-zA-Z][a-zA-Z0-9_-]*$",
        zeroUnits = "warning"
      }
    }
  },
  filetypes = {
    "css",
    "css.gtk",  -- Add GTK CSS filetype
    "less", 
    "scss",
    "sass"
  }
})

-- Enable cssls server
vim.lsp.enable('cssls')

-- Configure Make Language Server using bashls (can handle makefiles)
vim.lsp.config('bashls', {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {
    "sh",
    "bash",
    "make",
    "makefile",
    "mak"
  },
  cmd = { "bash-language-server", "start" },
  settings = {
    bashIde = {
      enable = true,
      -- Enable makefile-specific features
      shellcheckPath = vim.fn.exepath("shellcheck") or "",
      shfmt = {
        enable = false
      }
    }
  }
})

-- Enable bashls server for makefiles
vim.lsp.enable('bashls')

-- Export for use in other files
return {
  on_attach = on_attach,
  capabilities = capabilities
}