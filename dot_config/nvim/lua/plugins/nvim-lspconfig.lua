local lsp = require 'lspconfig'

-- Go
local custom_attach = function(client)
    require('compe_nvim_lsp').attach(client)
    require('lsp-status').on_attach(client)
end

local capabilities = require('lsp-status').capabilities
capabilities.textDocument.completion.completionItem.snippetSupport = true

lsp.gopls.setup{
    on_attach = custom_attach,
    capabilities = capabilities,
    init_options = {
        usePlaceholders = true;
    }
}

-- lua
local sumneko_root_path = "/home/morz/code/lua-language-server"
local sumneko_binary = "/home/morz/code/lua-language-server/bin/Linux/lua-language-server"

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

lsp.sumneko_lua.setup {
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                -- Setup your lua path
                path = runtime_path,
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'},
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
}
