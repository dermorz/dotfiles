let brain = {}
let brain.name = 'External brain'
let brain.path = '~/vimwiki/brain/'
let brain.syntax = 'markdown'
let brain.ext = '.md'
let brain.index = 'README'
let brain.links_space_char = '_'
let brain.nested_syntaxes = {'python': 'python', 'go': 'go', 'sql': 'sql', 'sh': 'sh'}

let g:vimwiki_list = [brain]
let g:vimwiki_global_ext = 0
let g:vimwiki_markdown_link_ext = 1
