set nocompatible              " be iMproved, required
" Compiling vim8
" LDFLAGS=-L$HOME/usr/local/lib ./configure --prefix=$HOME/dev/vim8/vim --enable-gui=yes --with-features=huge --enable-python3interp --enable-pythoninterp
filetype off                  " required
" set the runtime path to include Vundle and initialize
call plug#begin('~/.vim/plugged')

Plug 'Yggdroot/indentLine'
Plug 'davidhalter/jedi-vim'
Plug 'ervandew/supertab'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'mbbill/undotree'
Plug 'mitchpaulus/autocorrect.vim'
Plug 'gruvbox-community/gruvbox'
Plug 'ngemily/vim-vp4'
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'
Plug 'puremourning/vimspector'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vhda/verilog_systemverilog.vim'
Plug 'vim-latex/vim-latex'
Plug 'vimwiki/vimwiki'
Plug 'christoomey/vim-tmux-navigator'
Plug 'preservim/tagbar'
Plug 'xolox/vim-session'
Plug 'xolox/vim-misc'
Plug 'vim-airline/vim-airline'
Plug 'vim-scripts/LargeFile'


call plug#end()
filetype plugin indent on    " required
let mapleader=','
filetype plugin on
runtime macros/matchit.vim
" --------------------- END VUNDLE -----------------

" set autochdir
" set foldenable
set autoread 
set backspace=indent,eol,start
set conceallevel=1
set expandtab
set foldexpr=AtomStyleFolding(v:lnum)
set foldmethod=manual
set guioptions-=L
set ignorecase
set keymodel+=startsel
set keymodel+=stopsel 
set laststatus=2 " For lightline
set mouse=a
set nobackup
set noerrorbells
set noswapfile
set nobackup
set number
set relativenumber
set path+=**
set pythonthreedll=/usr/lib64/libpython3.6m.so.1.0
set sessionoptions-=options
set shiftwidth=4
set showcmd
set smartcase
set smarttab
set incsearch
set scrolloff=8
set softtabstop=4 tabstop=4
set spellfile=~/.vim/spell/en.utf-8.add
set splitbelow
set splitright
set tags=tags,.tags;
set timeoutlen=300
set undodir=~/undo_dir
set undofile
set visualbell
set wildmenu
syntax enable
let g:gruvbox_italic=1
let g:gruvbox_guisp_fallback = "bg"
let g:gruvbox_contrast_dark='high'
let g:gruvbox_improved_warnings = '0'
let g:LargeFile=10
set background=dark
colorscheme gruvbox
set hlsearch
set hidden

" --------------- END SET CMDs ------------------------
nnoremap <Leader>H :set hlsearch! hlsearch?<cr>
" nnoremap Path :let @+ = expand("%:p")<cr>
inoremap <silent> qq <Esc>
nnoremap <silent> <C-F> :let $FZF_DEFAULT_COMMAND='ag --hidden --path-to-ignore ~/dev/resources/.ignore --nocolor -g ""'<cr>:Files<cr>
nnoremap <silent> <Leader><Leader> <C-^>
nnoremap <silent> <Leader>q :q<cr>
noremap <silent> <Leader>t :tabnew<cr>
nnoremap <silent> <Leader>w :w<cr>
" nnoremap <silent> <C-h> <C-w><Left>
" nnoremap <silent> <C-j> <C-w><Down>
" nnoremap <silent> <C-k> <C-w><Up>
" nnoremap <silent> <C-l> <C-w><Right>
nnoremap <silent> <Leader>f :let $FZF_DEFAULT_COMMAND=""<cr>:Ag<cr>
nnoremap <silent> <Leader>l :BLines<CR>
nnoremap <silent> <F12> :syntax on<CR> :set relativenumber<CR>
nnoremap <silent> <F9> :syntax off<CR> :set norelativenumber<CR>
nnoremap <silent> <space> za
nnoremap <silent> tu :UndotreeToggle<cr>
vnoremap <silent> <Leader>p "+p
vnoremap <silent> <Leader>y "+y
vnoremap <silent> <Leader>f y:Ag <C-r>"<CR>
vnoremap <silent> <Leader>G y:BLines <C-r>"<CR>
vnoremap <silent> <Leader>g y/<C-r>"<CR>
nnoremap <silent> <Leader>h :History<cr>
vnoremap <Leader>r y:%s@<C-r>"@
vnoremap <silent> <space> zf
vnoremap <silent> J :m '>+1<CR>gv=gv
vnoremap <silent> K :m '<-2<CR>gv=gv
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

command! -bang FoldInc setlocal foldmethod=marker | setlocal foldmarker=include_hdl_start,include_hdl_stop | setlocal foldlevel=0 | setlocal foldmethod=manual
command! -bang Lrc :source ~/.vimrc " load vimrc with one command
command! -bang Path :let @+ = expand("%:p")
command! -bang FoldV setlocal foldmethod=syntax | setlocal foldlevel=0 | setlocal foldmethod=manual
command! -bang FoldPy setlocal foldmethod=indent | setlocal foldnestmax=1 | setlocal foldlevel=0 | setlocal foldmethod=manual
" ----------------------- END MAPPINGS ---------------


" function! GitBranch()
    " return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
  " endfunction

" set fillchars=stl:―,stlnc:—,vert:│,fold:۰,diff:·

" highlight vertsplit    cterm=none ctermbg=none ctermfg=9
" highlight statusline   cterm=none ctermbg=none ctermfg=14
" highlight statuslinenc cterm=none ctermbg=none ctermfg=9
" highlight specialkey   cterm=none ctermbg=none ctermfg=1
" highlight matchparen   cterm=none ctermbg=none ctermfg=5
" highlight wildmenu     cterm=bold ctermbg=none ctermfg=3
" highlight user1        cterm=none ctermbg=none ctermfg=3

" set statusline=
" set statusline+=%1*%f%*
" set statusline+=%(\ [%{fugitive#head()}%Y%R%W%M]%)
" set statusline+=%=
" set statusline+=[%(%l,%c%V%)]
" set statusline+=\ %1*%P%*


" ----------------------- END STATUSLINE ---------------

nnoremap <silent> tt :NERDTreeToggle<cr>
nnoremap <silent> tf :NERDTreeFind<cr>
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
let g:NERDSpaceDelims = 1
let g:NERDTreeChDirMode = 2 " Does cd whenever nerdtree root is also changed


" ----------------------- END NERDTREE ---------------
let g:ale_linters = {
      \   'python': ['pylint'],
      \}

" ----------------------- END ALE ---------------

let g:tagbar_ctags_bin = '/runs/simrun_tav/libs/bin/ctags'
let g:tagbar_file_size_limit = 10000

nnoremap <silent> <F8> :TagbarToggle<CR>


let g:tagbar_type_verilog = {
    \ 'kinds' : [
        \ 'c:constants:0:0',
        \ 'e:events',
        \ 'f:functions',
        \ 'm:modules',
        \ 'b:blocks',
        \ 'n:net data types',
        \ 'p:ports',
        \ 't:tasks',
    \ ],
\ }

let g:tagbar_type_systemverilog = {
    \ 'ctagstype': 'systemverilog',
    \ 'kinds' : [
         \'A:assertions',
         \'C:classes',
         \'E:enumerators',
         \'I:interfaces',
         \'K:packages',
         \'M:modports',
         \'P:programs',
         \'Q:prototypes',
         \'R:properties',
         \'S:structs and unions',
         \'T:type declarations',
         \'V:covergroups',
         \'b:blocks:0:0',
         \'c:constants',
         \'e:events',
         \'f:functions',
         \'m:modules:1:0',
         \'n:net data types',
         \'p:ports',
         \'t:tasks',
     \],
     \ 'sro': '.',
     \ 'kind2scope' : {
        \ 'K' : 'package',
        \ 'C' : 'class',
        \ 'm' : 'module',
        \ 'P' : 'program',
        \ 'I' : 'interface',
        \ 'M' : 'modport',
        \ 'f' : 'function',
        \ 't' : 'task',
        \ 'b' : 'blocks',
     \},
     \ 'scope2kind' : {
        \ 'package'   : 'K',
        \ 'class'     : 'C',
        \ 'module'    : 'm',
        \ 'program'   : 'P',
        \ 'interface' : 'I',
        \ 'modport'   : 'M',
        \ 'function'  : 'f',
        \ 'task'      : 't',
        \ 'blocks'    : 'b',
     \ },
     \}


" let g:tagbar_type_python = {
    " \ 'ctagsargs' : ' -f - --format=2 --excmd=pattern --extras= --fields=nksaSmt --kinds-python=+l ',
    " \ 'kinds' : [
        " \ 'i:modules:1:0',
        " \ 'c:classes',
        " \ 'f:functions',
        " \ 'm:members',
        " \ 'v:variables:0:0',
        " \ 'l:local:0:0',
        " \ '?:unknown',
    " \ ],
" \ }

" ----------------------- END TAGBAR ---------------

let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>a"
let g:jedi#goto_stubs_command = "<leader>s"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"
let g:jedi#show_call_signatures=2
let g:jedi#popup_on_dot = 0
" ----------------------- END JEDI ---------------

let g:SuperTabDefaultCompletionType = 'context'
let g:session_autoload = 'no'
let g:session_autosave = 'yes'
let g:indentLine_conceallevel = 1
let g:indentLine_color_term = 239
let g:indentLine_setColors = 239
let g:indentLine_char = '|'
let g:rainbow_active = 1 " Rainbow brakets
" ----------------------- END LETs ---------------

let g:AutocorrectFiletypes = ["text","markdown","tex"]
let g:AutocorrectPersonalFile='~/dev/usr/$USER/.autocorrect'

let g:vimwiki_list = [{'path': '~/dev/usr/$USER/wiki/vimwiki/'}]
let g:vimwiki_table_mappings = 0
" ----------------------- END TEXT STUFF---------------
let g:verilog_disable_indent_lst= "all"
let g:verilog_syntax_fold_lst = "class,function,task,module"

if exists("loaded_matchit")
      let b:match_ignorecase=0
        let b:match_words=
            \ '\<begin\>:\<end\>,' .
            \ '\<randcase\>\|\<case\>\|\<casex\>\|\<casez\>:\<endcase\>,' .
            \ '\<module\>:\<endmodule\>,' .
            \ '\<function\>:\<endfunction\>,' .
            \ '\(`ifdef\|`ifndef\)\>:`else\>:`endif\>,' .
            \ '\<task\>:\<endtask\>,' .
            \ '\<specify\>:\<endspecify\>'
    endif
                " \ '\<if\>:\<else\>,' .

" ----------------------- END VERILOG ---------------

nmap <leader>dc  <Plug>VimspectorContinue
" nmap <leader> <Plug>VimspectorStop
" nmap <leader> <Plug>VimpectorRestart
" nmap <leader> <Plug>VimspectorPause
nmap <leader>db <Plug>VimspectorToggleBreakpoint
" nmap <leader> <Plug>VimspectorToggleConditionalBreakpoint
" nmap <leader> <Plug>VimspectorAddFunctionBreakpoint
nmap <leader>drc <Plug>VimspectorRunToCursor
nmap <leader>dso <Plug>VimspectorStepOver
nmap <leader>dsi <Plug>VimspectorStepInto
nmap <leader>dst <Plug>VimspectorStepOut
" nmap <leader> <Plug>VimspectorUpFrame
" nmap <leader> <Plug>VimspectorDownFrame

" ----------------------- END VIMSPECTOR ---------------
augroup pbharati
  autocmd!
  " autocmd BufReadPre,BufEnter * if getfsize(@%) > 100000 | setlocal syntax="" | setlocal norelativenumber | endif
  " autocmd BufReadPre,BufEnter * if getfsize(@%) < 1000000 | syntax on | endif
  " autocmd BufEnter * let &colorcolumn=""
  autocmd InsertLeave,WinEnter,TabEnter * let &l:foldmethod=g:oldfoldmethod
  autocmd InsertEnter,WinLeave,TabLeave * let g:oldfoldmethod=&l:foldmethod | setlocal foldmethod=manual
  " autocmd BufEnter,TabEnter,WinEnter * IndentLinesReset
  autocmd BufNewFile,BufRead *.md setlocal foldmethod=expr | setlocal filetype=markdown
  autocmd BufWritePost *.tex :silent :!/home/pbharati/dev/usr/pbharati/ds_schism/paper/make_tex.sh
  autocmd BufEnter *.tex setlocal spell
  autocmd BufEnter *.wiki setlocal spell
  autocmd BufLeave *.tex setlocal nospell
  autocmd BufLeave *.wiki setlocal nospell
augroup exit


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

function! Trim(input_string)
    return substitute(a:input_string, '^\s*\(.\{-}\)\s*$', '\1', '')
endfunction
