-- vimwiki
local g = vim.g
local cmd = vim.cmd

g['vimwiki_list'] = {{
    name = 'brain',
    path = '~/.cache/vimwiki/brain',
    syntax = 'markdown',
    ext = '.md',
    index = 'README',
    links_space_char = '_',
    nested_syntaxes = {
        go = 'go',
        yaml = 'yaml',
        json = 'json',
    },
}}
g['vimwiki_global_ext'] = 0
g['vimwiki_markdown_link_ext'] = 1
cmd('au BufNewFile,BufReadPost ~/.cache/vimwiki/brain/*.md set ft=markdown')
