set nocompatible              " be iMproved, required
filetype off                  " required
call plug#begin('~/.vim/plugged')

" Plug 'ThePrimeagen/vim-be-good'
" Plug 'mitchpaulus/autocorrect.vim'
Plug 'chrisbra/csv.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ThePrimeagen/git-worktree.nvim'
Plug 'godlygeek/tabular'
Plug 'gruvbox-community/gruvbox'
Plug 'hoob3rt/lualine.nvim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'mbbill/undotree'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ngemily/vim-vp4'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'
Plug 'preservim/tagbar'
Plug 'neovim/nvim-lspconfig'
Plug 'puremourning/vimspector'
Plug 'tmhedberg/SimpylFold'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vhda/verilog_systemverilog.vim'
Plug 'vimwiki/vimwiki'

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
set nowrap
set foldexpr=AtomStyleFolding(v:lnum)
set foldmethod=manual
set guioptions-=L
set ignorecase
set keymodel+=startsel
set keymodel+=stopsel 
set mouse=a
set noerrorbells
set noswapfile
set nobackup
set backupdir=/dev/null
set nowritebackup
set number
set relativenumber
set path+=**
set sessionoptions-=options
set shiftwidth=4
set showcmd
set smartcase
set laststatus=2
set smarttab
set incsearch
set scrolloff=8
set softtabstop=4 tabstop=4
set spellfile=~/.vim/spell/en.utf-8.add
set splitbelow
set splitright
set tags=tags,.tags;
set timeoutlen=300
set undodir=~/.nvim/undo_dir
set undofile
set visualbell
set wildmenu
syntax enable
" let g:gruvbox_italic=1
let g:gruvbox_guisp_fallback = "bg"
let g:gruvbox_contrast_dark='high'
let g:gruvbox_improved_warnings = '0'
" let g:LargeFile=300
set hlsearch
set hidden
set shell=/bin/bash\ --login
set background=dark
colorscheme gruvbox
" --------------- END SET CMDs ------------------------
nnoremap <Leader>H :set hlsearch! hlsearch?<cr>
nnoremap <Leader>W :set wrap<cr>
" nnoremap Path :let @+ = expand("%:p")<cr>
inoremap <silent> qq <Esc>
nnoremap <silent> <Leader><Leader> <C-^>
nnoremap <silent> <Leader>q :q<cr>
noremap <silent> <Leader>t :tabnew<cr>
nnoremap <silent> <Leader>w :w<cr>
nnoremap <silent> <S-Tab> gt
nnoremap <silent> Y y$
nnoremap <silent> tq :copen<cr>
nnoremap <silent> <M-j> :cn<cr>
nnoremap <silent> <M-k> :cp<cr>
nnoremap <silent> <M-n> :lnext<cr>
nnoremap <silent> <M-p> :lprevious<cr>

" USING FZF
" nnoremap <silent> <Leader>f :let $FZF_DEFAULT_COMMAND=""<cr>:Ag<cr>
" nnoremap <silent> <C-F> :let $FZF_DEFAULT_COMMAND='ag --hidden --path-to-ignore ~/dev/resources/.ignore --nocolor -g ""'<cr>:Files<cr>
" nnoremap <silent> <Leader>h :History<cr>
" nnoremap <silent> <Leader>l :BLines<CR>
vnoremap <silent> <Leader>G y:BLines <C-r>"<CR>
" vnoremap <silent> <Leader>f y:Rg <C-r>"<CR>
" nnoremap <silent> <Leader>f y:Rg<CR> 
"
"
"
" USING TELESCOPE
lua << EOF
require('telescope').setup{
  defaults = {
    -- ...
  },
  pickers = {
    find_files = {
      hidden = true
    },
    live_grep = {
      sorter=fzf
    }
  },
  extensions = {
    --    fzf = {
    --      fuzzy = true,                    -- false will only do exact matching
    --      override_generic_sorter = true,  -- override the generic sorter
    --      override_file_sorter = true,     -- override the file sorter
    --      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
    --                                      -- the default case_mode is "smart_case"
    --      },
    fzy_native = {
        override_generic_sorter = true,
        override_file_sorter = true,
    }
  }
}
require('telescope').load_extension('fzy_native')
require("telescope").load_extension("git_worktree")

EOF

nnoremap <silent> <Leader>l <cmd>Telescope current_buffer_fuzzy_find<cr>
nnoremap <silent> <Leader>f <cmd>Telescope live_grep<cr>
nnoremap <silent> <C-F>     <cmd>Telescope find_files<cr>
nnoremap <silent> te        <cmd>Telescope<cr>
nnoremap <silent> <Leader>h <cmd>Telescope oldfiles<cr>
nnoremap <silent> <leader>F :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
vnoremap <silent> <leader>f y:lua require('telescope.builtin').grep_string({search = vim.fn.getreg('"')})<CR>

nnoremap <silent> <Leader>twt :lua require('telescope').extensions.git_worktree.git_worktrees()<cr>
                                " -- <Enter> - switches to that worktree
                                " -- <c-d> - deletes that worktree
                                " -- <c-D> - force deletes that worktree
                                
nnoremap <silent> <F12> :syntax on<CR> :set relativenumber<CR>
nnoremap <silent> <F9> :syntax off<CR> :set norelativenumber<CR>
nnoremap <silent> <space> za
nnoremap <silent> tu :UndotreeToggle<cr>
vnoremap <silent> <Leader>p "+p
vnoremap <silent> <Leader>y "+y
vnoremap <silent> <Leader>g y/\v<C-r>"<CR>
vnoremap <Leader>r y:%s@<C-r>"@
vnoremap <silent> <space> zf
vnoremap <silent> J :m '>+1<CR>gv=gv
vnoremap <silent> K :m '<-2<CR>gv=gv
nnoremap <silent> dgl :diffget //3<CR>
nnoremap <silent> dgh :diffget //2<CR>
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
" command! -bang Lrc :source ~/.vimrc " load vimrc with one command
command! -bang LLL :source ~/.config/nvim/init.vim " load vimrc with one command
command! -bang Path :let @+ = expand("%:p")
command! -bang FoldV setlocal foldmethod=syntax | setlocal foldlevel=0 | setlocal foldmethod=manual
" command! -bang FoldPy setlocal foldmethod=indent | setlocal foldnestmax=2 | setlocal foldlevel=0 | setlocal foldmethod=manual
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
" " set statusline+=%=
" set statusline+=[%(%l,%c%V%)]
" set statusline+=\ %1*%P%*
lua << EOF
require'lualine'.setup {
  options = {
    icons_enabled = false,
    theme = 'gruvbox',
    component_separators = {'|', '|'},
    section_separators = {'|', '|'},
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'FugitiveHead'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
EOF




" ----------------------- END STATUSLINE ---------------

nnoremap <silent> tt :NERDTreeToggle<cr>
nnoremap <silent> tf :NERDTreeFind<cr>
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
let g:NERDSpaceDelims = 1
let g:NERDTreeChDirMode = 2 " Does cd whenever nerdtree root is also changed


" ----------------------- END NERDTREE ---------------

let g:tagbar_ctags_bin = '/runs/simrun_tav/libs/bin/ctags'
let g:tagbar_file_size_limit = 50000000

nnoremap <silent> tg :TagbarToggle<CR>


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
let g:jedi#popup_on_dot = 1
" ----------------------- END JEDI ---------------

let g:vimwiki_list = [{'path': '~/dev/usr/$USER/wiki/vimwiki/'}]
let g:vimwiki_table_mappings = 0
let &t_TI = "\<Esc>[>4;2m"
let &t_TE = "\<Esc>[>4;m"

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

set completeopt=menu,menuone,noselect

lua << EOF
    -- Setup lspconfig.
    local servers = { 'pyright', 'bashls'}
    local nvim_lsp = require('lspconfig')
    -- Use an on_attach function to only map the following keys
    -- after the language server attaches to the current buffer
    local on_attach = function(client, bufnr)
        local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
        local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

        -- Enable completion triggered by <c-x><c-o>
        buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

        -- Mappings.
        local opts = { noremap=true, silent=true }

        -- See `:help vim.lsp.*` for documentation on any of the below functions
        buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
        buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
        buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
        buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
        buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
        buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
        buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
        buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
        buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
        buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
        buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
        buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
        buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
        buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
        buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
        buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
        buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

        end
    -- Setup nvim-cmp.
    local cmp = require'cmp'

    cmp.setup({
        snippet = {
            expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
            -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
            end,
        },
        mapping = {
            ['<Tab>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
            ['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
            ['<Down>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
            ['<Up>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
            ['<C-d>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.close(),
            ['<CR>'] = cmp.mapping.confirm({
                                            behavior = cmp.ConfirmBehavior.Replace,
                                            select = true,
                                              }),
          },
        sources = cmp.config.sources({
            { name = 'nvim_lsp' },
            { name = 'vsnip' }, -- For vsnip users.
            -- { name = 'luasnip' }, -- For luasnip users.
            -- { name = 'ultisnips' }, -- For ultisnips users.
            -- { name = 'snippy' }, -- For snippy users.
            }, {
            { name = 'buffer' },
            })
    })

    local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
    for _, lsp in ipairs(servers) do
      nvim_lsp[lsp].setup {
          on_attach = on_attach,
          capabilities = capabilities,
          flags = {
              debounce_text_changes = 150,
              }
          }
    end


EOF





" ----------------------- END COC ---------------
augroup pbharati
  autocmd!
  autocmd BufReadPre,BufEnter * if getfsize(@%) > 100000 | setlocal syntax="" | setlocal norelativenumber | endif
  autocmd BufReadPre,BufEnter * if getfsize(@%) < 1000000 | syntax on | endif
  autocmd VimLeavePre * :call coc#rpc#kill()
  " autocmd BufEnter * let &colorcolumn=""
  autocmd InsertEnter,WinLeave,TabLeave * let g:oldfoldmethod=&l:foldmethod | setlocal foldmethod=manual
  autocmd InsertLeave,WinEnter,TabEnter * let &l:foldmethod=g:oldfoldmethod
  " autocmd BufEnter,TabEnter,WinEnter * IndentLinesReset
  autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
  autocmd BufReadPre,BufEnter,TabEnter,WinEnter *.inc set syntax=verilog
  " autocmd BufWritePost *.tex :silent :!/home/pbharati/dev/usr/pbharati/ds_schism/paper/make_tex.sh
  " autocmd BufEnter *.wiki setlocal spell
  " autocmd BufEnter *.tex setlocal spell
  " autocmd BufLeave *.tex setlocal nospell
  " autocmd BufLeave *.wiki setlocal nospell
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

function! Trim(input_string)
    return substitute(a:input_string, '^\s*\(.\{-}\)\s*$', '\1', '')
endfunction
