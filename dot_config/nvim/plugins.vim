" Vim plugin configuration
set rtp+=~/.config/nvim/plugins/

call plug#begin('~/.config/nvim/plugged')

runtime appearance.vim
runtime git.vim
runtime helpers.vim
runtime languages.vim
runtime project.vim
runtime search.vim
runtime textobjects.vim
runtime tools.vim

call plug#end()

