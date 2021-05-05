" Use Vim settings instead of Vi settings
set nocompatible

" General config
set hidden
set hlsearch
set cmdheight=2
set updatetime=300
" set signcolumn=number
set splitbelow
set splitright
syntax on
set list
set listchars=eol:¬,tab:»\ ,nbsp:·,trail:·,extends:→,precedes:←
set nofoldenable
set lazyredraw
set backspace=indent,eol,start
set visualbell
set encoding=UTF-8

" Plugins
filetype off
if filereadable(expand("~/.config/nvim/plugins.vim"))
  source ~/.config/nvim/plugins.vim
endif
filetype plugin indent on

" Line numbers
set number
set relativenumber
set ruler

" Turn off swap files
set noswapfile
set nobackup
set nowritebackup

" Indentation
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" Set leaders
let mapleader=" "
let maplocalleader=";"

" Completion
set wildmode=longest:full,full
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*.pyc
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif
set completeopt=menu,preview

" Persistent Undo
" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo')
  silent !mkdir ~/.config/nvim/undo > /dev/null 2>&1
  set undodir=~/.config/nvim/undo
  set undofile
endif

" Helper to preserve state on commands
function! Preserve(command)
  let _s=@/
  let l = line(".")
  let c = col(".")
  execute a:command
  let @/=_s
  call cursor(l, c)
endfunction

" Remove trailing whitespace
autocmd BufWritePre *
     \ silent call Preserve("%s/\\s\\+$//e")

" Custom settings
source ~/.config/nvim/settings.vim
