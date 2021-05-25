set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
" set the runtime path to include Vundle and initialize
call vundle#begin()

" Plugin 'tpope/vim-fugitive'
Plugin 'VundleVim/Vundle.vim'
Plugin 'preservim/nerdcommenter'
Plugin 'preservim/nerdtree'
Plugin 'altercation/vim-colors-solarized'
Plugin 'joshdick/onedark.vim'
Plugin 'frazrepo/vim-rainbow'
Plugin 'ngemily/vim-vp4'
Plugin 'sheerun/vim-wombat-scheme'
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/fzf'
Plugin 'Yggdroot/indentLine'
Plugin 'vhda/verilog_systemverilog.vim'
Plugin 'ervandew/supertab'
Plugin 'xolox/vim-session'
Plugin 'xolox/vim-misc'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-scripts/sherlock.vim'
Plugin 'mbbill/undotree'
Plugin 'uguu-org/vim-matrix-screensaver'
Plugin 'tpope/vim-surround'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'


call vundle#end()            " required
filetype plugin indent on    " required
let mapleader=','
filetype plugin on

" --------------------- END VUNDLE -----------------

set foldexpr=AtomStyleFolding(v:lnum)
set foldmethod=manual
" set foldenable
set visualbell
set mouse=a
set nowritebackup
set nobackup
set showcmd
set splitright
set splitbelow
set noerrorbells
set wildmenu
set smartcase
set ignorecase
set undofile
set undodir=~/.vim/undo_dir
set sessionoptions-=options
set laststatus=2 " For lightline
set guioptions-=L
set smarttab
set conceallevel=1
set expandtab
set softtabstop=4
set shiftwidth=4
" set autochdir
set keymodel+=startsel
set keymodel+=stopsel 
set number
set tags=tags,.tags;
set autoread 

syntax enable

colorscheme wombat

" --------------- END SET CMDs ------------------------
" nnoremap Path :let @+ = expand("%:p")<cr>
nnoremap <Leader>t :tabnew<cr>
nnoremap <Leader>q :q<cr>
nnoremap <Leader>s :w<cr>
vnoremap <Leader>y "+y
vnoremap <Leader>p "+p
nnoremap <silent> <C-l> :wincmd l<CR>
nnoremap <silent> <C-h> :wincmd h<CR>
nnoremap <silent> <C-j> :wincmd j<CR>
nnoremap <silent> <C-k> :wincmd k<CR>
nnoremap <Leader><Leader> <C-^>
nnoremap <silent><S-F12> :call Switch_synhl()<CR>
nnoremap <A-a> <C-a>
nnoremap <A-x> <C-x>
noremap <C-a> ^
noremap <C-s> $
nnoremap <space> :set hlsearch! hlsearch?<cr>
inoremap qq <Esc>

command! -bang FoldInc setlocal foldmethod=marker | setlocal foldmarker=include_hdl_start,include_hdl_stop | setlocal foldlevel=0 | setlocal foldmethod=manual
command! -bang Lrc :source ~/.vimrc " load vimrc with one command
command! -bang Path :let @+ = expand("%:p")
command! -bang FoldV setlocal foldmethod=syntax | setlocal foldlevel=0 | setlocal foldmethod=manual

nnoremap <Leader>h :History<cr>
nnoremap tu :UndotreeToggle<cr>
nnoremap <C-F> :let $FZF_DEFAULT_COMMAND='ag --hidden --path-to-ignore ~/dev/resources/.ignore --nocolor -g ""'<cr>:Files<cr>
nnoremap <silent> <Leader>f :let $FZF_DEFAULT_COMMAND=""<cr>:Ag<cr>
nnoremap <silent> <Leader>g :Lines<CR>
vnoremap <silent> <Leader>f y:Ag <C-r>"<CR>
vnoremap <silent> <Leader>g y/<C-r>"<CR>
vnoremap <silent> <Leader>r y:%s@<C-r>"@


" ----------------------- END MAPPINGS ---------------


nnoremap tt :NERDTreeToggle<cr>
nnoremap tf :NERDTreeFind<cr>
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
let g:NERDSpaceDelims = 1
let g:NERDTreeChDirMode = 2 " Does cd whenever nerdtree root is also changed


" ----------------------- END NERDTREE ---------------

let g:SuperTabDefaultCompletionType = 'context'
let g:session_autoload = 'no'
let g:session_autosave = 'yes'
let g:indentLine_conceallevel = 1
let g:indentLine_color_term = 239
let g:indentLine_setColors = 239
let g:indentLine_char = '|'
let g:rainbow_active = 1 " Rainbow brakets
let g:vim_markdown_folding_disabled = 1
" ----------------------- END LETs ---------------
let g:ctrlp_regexp = 1
let g:ctrlp_working_path_mode = 0
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_extensions = ['buffertag', 'tag', 'line', 'dir']
let g:ctrlp_cmd = 'CtrlPMRU'
let g:ctrlp_show_hidden = 1
let g:ctrlp_use_caching = 1

" ----------------------- END CTRLP ---------------
let g:verilog_disable_indent_lst= "all"
let g:verilog_syntax_fold_lst = "function,task"

" ----------------------- END VERILOG ---------------

autocmd BufReadPre,BufEnter * if getfsize(@%) > 1000000 | syntax off | endif
" autocmd BufReadPre,BufEnter * if getfsize(@%) < 1000000 | syntax on | endif
" autocmd BufEnter * let &colorcolumn=""
autocmd InsertLeave,WinEnter,TabEnter * let &l:foldmethod=g:oldfoldmethod
autocmd InsertEnter,WinLeave,TabLeave * let g:oldfoldmethod=&l:foldmethod | setlocal foldmethod=manual
autocmd BufEnter,TabEnter,WinEnter * IndentLinesReset
autocmd BufNewFile,BufRead *.md set foldmethod=expr | set filetype=markdown
" ----------------------- END AUTOCMDs ---------------
function! ToggleGUICruft()
  if &guioptions=='i'
    exec('set guioptions=imTrL')
  else
    exec('set guioptions=i')
  endif
endfunction

map <F11> <Esc>:call ToggleGUICruft()<cr>

" by default, hide gui menus
set guioptions=i


" Finds the indent of a line. The indent of a blank line is the indent of the
" first non-blank line above it.
function! FindIndent(line_number, indent_width)
    " Regular expression for a "blank" line
    let regexp_blank = "^\s*$"

    let non_blank_line = a:line_number
    while non_blank_line > 0 && getline(non_blank_line) =~ regexp_blank
        let non_blank_line = non_blank_line - 1
    endwhile
    return indent(non_blank_line) / a:indent_width
endfunction

" 'foldexpr' for Atom-style indent folding
function! AtomStyleFolding(line_number)
    let indent_width = &shiftwidth

    " Find current indent
    let indent = FindIndent(a:line_number, indent_width)

    " Now find the indent of the next line
    let indent_below = FindIndent(a:line_number + 1, indent_width)

    " Calculate indent level
    if indent_below > indent
        return indent_below
    elseif indent_below < indent
        return "<" . indent
    else
        return indent
    endif
endfunction

function! Switch_synhl()
    if &syntax == "on"
        set syntax=off
    else
        set syntax=on
    endif
endfunction


function! Trim(input_string)
    return substitute(a:input_string, '^\s*\(.\{-}\)\s*$', '\1', '')
endfunction
