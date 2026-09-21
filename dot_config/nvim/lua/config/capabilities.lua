-- Shared LSP capabilities for all language servers
local capabilities = vim.lsp.protocol.make_client_capabilities()

-- Add completion capabilities from nvim-cmp if available
local ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if ok then
  capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
end

-- Add textDocument/foldingRange support
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true
}

return capabilities