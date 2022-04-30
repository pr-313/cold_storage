set nocompatible              " be iMproved, required
filetype off                  " required
silent! let g:plugs['LuaSnip'].commit = 'cd96f418fd08d4226370349d5f0cee168051dbd6'
silent! let g:plugs['cmp_luasnip'].commit = 'd6f837f4e8fe48eeae288e638691b91b97d1737f'
call plug#begin('~/.vim/plugged')

Plug 'ThePrimeagen/git-worktree.nvim'
Plug 'tpope/vim-fugitive'
Plug 'ThePrimeagen/harpoon'
Plug 'chrisbra/csv.vim'
Plug 'godlygeek/tabular'
Plug 'gruvbox-community/gruvbox'
Plug 'hoob3rt/lualine.nvim'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-path'
" Plug 'lukas-reineke/cmp-rg'
Plug 'hrsh7th/nvim-cmp'
Plug 'saadparwaiz1/cmp_luasnip', {'commit': 'd6f837f4e8fe48eeae288e638691b91b97d1737f'}
Plug 'L3MON4D3/LuaSnip', {'branch': 'ls_snippets_preserve'}
Plug 'junegunn/fzf', {'on' : 'BLines'}
Plug 'junegunn/fzf.vim', {'on' : 'BLines'}
Plug 'elzr/vim-json', {'for' : 'json'} 
Plug 'mbbill/undotree', {'on': 'UndotreeToggle'}
Plug 'neovim/nvim-lspconfig'
Plug 'ngemily/vim-vp4'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope.nvim', {'on' : ['Telescope']}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree', {'on': ['NERDTreeToggle', 'NERDTreeFind', 'NERDTree']}
Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'kyazdani42/nvim-tree.lua'
Plug 'preservim/tagbar', {'on': 'TagBarToggle'}
Plug 'tmhedberg/SimpylFold'
Plug 'tpope/vim-surround'
Plug 'tweekmonster/startuptime.vim'
Plug 'vhda/verilog_systemverilog.vim'
Plug 'puremourning/vimspector', {'on' : '<Plug>VimspectorContinue'}
Plug 'vimwiki/vimwiki', {'on': ['VimwikiIndex']}
Plug 'akinsho/toggleterm.nvim'
Plug 'szw/vim-maximizer'
Plug 'airblade/vim-gitgutter'


call plug#end()
filetype plugin indent on    " required
let mapleader=','
filetype plugin on
runtime macros/matchit.vim
" cause screw ex mode
nnoremap Q <Nop>  
let g:loaded_python3_provider = 0
let g:loaded_ruby_provider = 0
let g:loaded_perl_provider = 0
" --------------------- END VUNDLE -----------------

syntax enable
" let g:gruvbox_italic=1
let g:gruvbox_guisp_fallback = "bg"
let g:gruvbox_contrast_dark='high'
let g:gruvbox_improved_warnings = '0'
let g:LargeFile=100
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_preview=1
let g:netrw_altv = 1
let g:netrw_winsize = 15
colorscheme gruvbox
" --------------- END SET CMDs ------------------------
nnoremap  <silent>  <Leader>H          :set hlsearch! hlsearch?<cr>
nnoremap  <silent>  <Leader>W          :set wrap! wrap?<cr>
nnoremap  <silent>  <Leader><Leader>   :Lex<cr>
nnoremap  <silent>  <Leader>.          :call NerdFindNetrw()<cr>
nnoremap  <silent>  <Leader>q          :q<cr>
nnoremap  <silent>  <Leader>Q          :qa<cr>
nnoremap  <silent>  <Leader>t          :tabnew<cr>
nnoremap  <silent>  <Leader>w          :w<cr>
nnoremap  <silent>  Y                  y$
nnoremap  <silent>  <S-Tab>            gt
nnoremap  <silent>  tq                 :copen<cr>
nnoremap  <silent>  <M-n>              :cn<cr>
nnoremap  <silent>  <M-b>              :cp<cr>
" nnoremap  <silent>  <M-n>              :lnext<cr>
" nnoremap  <silent>  <M-p>              :lprevious<cr>
nnoremap  <silent>  n                  nzzzv
nnoremap  <silent>  N                  Nzzzv
nnoremap  <silent>  <M-h>              :call TmuxResize('h', 4)<CR>
nnoremap  <silent>  <M-j>              :call TmuxResize('j', 4)<CR>
nnoremap  <silent>  <M-k>              :call TmuxResize('k', 4)<CR>
nnoremap  <silent>  <M-l>              :call TmuxResize('l', 4)<CR>
inoremap  <silent>  qq                 <Esc>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <silent> <leader><leader> :MaximizerToggle<CR>

nnoremap <silent> <F12> :syntax on<CR> :set relativenumber<CR>
nnoremap <silent> <F9> :syntax off<CR> :set norelativenumber<CR>
nnoremap <silent> <space> za
nnoremap <silent> dgh :diffget //2<CR>
nnoremap <silent> dgl :diffget //3<CR>
nnoremap <silent> tu :UndotreeToggle<cr>
vnoremap <Leader>r y:%s@<C-r>"@
vnoremap <silent> <Leader>g y/\v<C-r>"<CR>
vnoremap <silent> <Leader>p "+p
vnoremap <silent> <Leader>y "+y
vnoremap <silent> <space> zf
vnoremap <silent> J :m '>+1<CR>gv=gv
vnoremap <silent> K :m '<-2<CR>gv=gv

" inoremap ( ()<left>
" inoremap [ []<left>
" inoremap { {}<left>
" inoremap {<CR> {<CR>}<ESC>O
" inoremap {;<CR> {<CR>};<ESC>O

inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

command! -bang FoldInc setlocal foldmethod=marker | setlocal foldmarker=include_hdl_start,include_hdl_stop | setlocal foldlevel=0 | setlocal foldmethod=manual
command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor
command! -bang LLL :call SourceConfig()
command! -bang Path :let @+ = expand("%:p")
command! -bang Conf :tabnew ~/.config/nvim/init.vim
command! -bang FoldV setlocal foldmethod=syntax | setlocal foldlevel=0 | setlocal foldmethod=manual
command! -bang LetmeWrite setlocal cpoptions-=W
" command! -bang FoldPy setlocal foldmethod=indent | setlocal foldnestmax=2 | setlocal foldlevel=0 | setlocal foldmethod=manual
" ----------------------- END MAPPINGS ---------------
augroup pbharati
  autocmd!
  autocmd BufReadPre,BufRead * if getfsize(@%) > 1000000 | setlocal syntax="" | setlocal norelativenumber | endif
  " autocmd BufReadPre,BufEnter * if getfsize(@%) < 1000000 | syntax on | endif
  autocmd InsertEnter,WinLeave,TabLeave * let g:oldfoldmethod=&l:foldmethod | setlocal foldmethod=manual
  autocmd InsertLeave,WinEnter,TabEnter * let &l:foldmethod=g:oldfoldmethod
  autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
  autocmd BufReadPre,BufEnter,TabEnter,WinEnter *.inc set filetype=verilog_systemverilog
  autocmd VimEnter * :silent! source ~/my_nvim/*.vim
  autocmd! User telescope.nvim :call SetupTelescope()
augroup exit
:silent! source ~/my_nvim/*.vim

