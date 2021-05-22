" Navigate errors
nmap <silent> <C-h> :cprev<CR>
nmap <silent> <C-l> :cnext<CR>

" Quicksave
map <leader>w :w<CR>

" Append comma
map <leader>, A,<ESC>

" Buffer navigation
nmap H :bp<CR>
nmap L :bn<CR>

" Open shell in vertical split buffer
map <leader>z :vs term://zsh<CR>
" Escape shell input
tnoremap <Esc><Esc> <C-\><C-n>

" Change paste motion rp{motion}
nmap <silent> rp :set opfunc=ChangePaste<CR>g@
function! ChangePaste(type, ...)
    silent exe "normal! `[v`]\"_c"
    silent exe "normal! p"
endfunction

" $MYVIMRC convenience
nmap <leader>ve :e $MYVIMRC<cr>
nmap <leader>vs :so $MYVIMRC<cr>

" Copy/Paste with system clipboard
map cv "+p
map cp "+y

" :help navigation
nnoremap t <C-]>
