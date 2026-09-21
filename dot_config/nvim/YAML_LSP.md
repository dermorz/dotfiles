# YAML LSP Configuration

This configuration provides comprehensive YAML language server support with schema validation for Kubernetes, Helm, Docker Compose, and more.

## Features

- **Auto-completion** for YAML keys and values
- **Schema validation** for common file types
- **Hover documentation** 
- **Go-to-definition** and **references**
- **Code actions** and **quick fixes**

## Supported File Types & Schemas

### Kubernetes
- Files matching: `*.k8s.yaml`, `*.k8s.yml`, `**/k8s/*.yaml`, `templates/**/*`, `deployments/*.yaml`, `manifests/*.yaml`
- Schema: Kubernetes v1.28.0

### Helm
- Files matching: `Chart.yaml`, `helmfile.yaml`
- Schema: Helm chart and helmfile schemas

### GitHub Actions
- Files matching: `.github/workflows/*`
- Schema: GitHub Actions workflow schema

### Docker Compose
- Files matching: `docker-compose.yml`, `docker-compose.yaml`, `docker-compose.*.yml`
- Schema: Docker Compose specification

### Open Component Model (OCM)
- Files matching: `component-descriptor.yaml`, `component-descriptor.yml`
- Schema: OCM component schema

### Others
- CircleCI: `.circleci/config.yml`
- GitLab CI: `.gitlab-ci.yml`
- Ansible: `*.ansible.yml`
- Pre-commit: `.pre-commit-config.yaml`

## Keybindings

- `gd` - Go to definition
- `gD` - Go to declaration  
- `gr` - Show references
- `gi` - Go to implementation
- `K` - Hover documentation
- `<leader>rn` - Rename symbol
- `<leader>ca` - Code actions
- `[d`/`]d` - Navigate diagnostics
- `<leader>e` - Show diagnostics
- `<leader>f` - Format (if server supports it)

## Configuration Files

- `lua/config/lsp.lua` - Main LSP configuration
- `lua/config/capabilities.lua` - Shared LSP capabilities
- `lua/plugins/lsp.lua` - Plugin specifications
- `lua/plugins/treesitter.lua` - YAML syntax highlighting

## Notes

Uses the new `vim.lsp.config` framework (Neovim 0.11+) instead of the deprecated `require('lspconfig')` approach.