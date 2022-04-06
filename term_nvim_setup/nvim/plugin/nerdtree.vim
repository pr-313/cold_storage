nnoremap <silent> tt :NERDTreeToggle<cr>
nnoremap <silent> tf :NERDTreeFind<cr>
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
let g:NERDSpaceDelims = 1
let g:NERDTreeChDirMode = 2 " Does cd whenever nerdtree root is also changed
let NERDTreeShowHidden=1
