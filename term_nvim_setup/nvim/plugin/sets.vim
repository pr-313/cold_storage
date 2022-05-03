" set autochdir
" set foldenable
set autoread 
set backspace=indent,eol,start
set backupdir=/dev/null
set conceallevel=1
" set clipboard=unnamedplus
set expandtab
set foldmethod=manual
" set guioptions-=L
set ignorecase
set incsearch
set keymodel+=startsel
set keymodel+=stopsel 
set mouse=a
set nobackup
set noerrorbells
set noswapfile
set nowrap
set nowritebackup
set guicursor=n-v-c-sm:block,i-ci-ve:block,r-cr-o:hor20
set number
set path+=**
set scrolloff=8
set sessionoptions-=options
set shiftwidth=4
set showcmd
set smartcase
set smarttab
set softtabstop=4 tabstop=4
set spellfile=~/.vim/spell/en.utf-8.add
set splitbelow
set splitright
set tags=tags,.tags;
set timeoutlen=300
set undodir=~/.nvim/undo_dir
set undofile
set wildmenu
set completeopt=menu,menuone,noselect
set guioptions=i
set hlsearch
set hidden
set shell=/bin/bash\ --login
set background=dark
set cpoptions+=W    
set updatetime=1000
if exists("g:gonvim_running")
    set title
    set titlestring=
    set guifont=Monaco:h11
endif
if has('gui_vimr')
    set title
    set titlestring=
    set guifont=Monaco:h11
    set wrap
endif
