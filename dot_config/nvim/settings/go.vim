autocmd BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_auto_sameids = 0
let g:go_fmt_command = "goimports"
let g:go_addtags_transform = "snakecase"
let g:go_def_mode = "gopls"
let g:go_referrers_mode = "gopls"
let g:go_info_mode = "gopls"
let g:go_def_mapping_enabled = 0
let g:go_doc_popup_window = 1

" `ginkgo watch` in horizontal split
nmap <leader>gw :cd %:p:h<CR>:15sp term://ginkgo watch -tags unit,integration<CR>:cd -<CR>
nmap <leader>gu :cd %:p:h<CR>:15sp term://ginkgo watch -tags unit<CR>:cd -<CR>
