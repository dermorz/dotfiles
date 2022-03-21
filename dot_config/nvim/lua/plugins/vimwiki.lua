-- vimwiki
local g = vim.g

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
g['vimwiki_auto_chdir'] = 1
