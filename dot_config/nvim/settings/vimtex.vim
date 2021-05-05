let g:vimtex_compiler_latexmk = {
      \ 'executable' : 'latexmk',
      \ 'options' : [
      \   '-xelatex',
      \   '-file-line-error',
      \   '-synctex=1',
      \   '-interaction=nonstopmode',
      \ ],
      \}

autocmd Filetype tex setl updatetime=1
let g:livepreview_previewer = 'open -a Preview'
