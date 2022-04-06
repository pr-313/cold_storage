" USING FZF
" nnoremap <silent> <Leader>f :let $FZF_DEFAULT_COMMAND=""<cr>:Ag<cr>
" nnoremap <silent> <C-F> :let $FZF_DEFAULT_COMMAND='ag --hidden --path-to-ignore .ignore --nocolor -g ""'<cr>:Files<cr>
" nnoremap <silent> <Leader>h :History<cr>
" nnoremap <silent> <Leader>l :BLines<CR>
vnoremap <silent> <Leader>G y:BLines <C-r>"<CR>
" vnoremap <silent> <Leader>f y:Rg <C-r>"<CR>
" nnoremap <silent> <Leader>f y:Rg<CR> 

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
      sorter=fzf_native
    }
  },
  extensions = {
    fzf = {
          fuzzy = true,                    -- false will only do exact matching
          override_generic_sorter = true,  -- override the generic sorter
          override_file_sorter = true,     -- override the file sorter
          case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                          -- the default case_mode is "smart_case"
          },
   -- fzy_native = {
   --     override_generic_sorter = true,
   --     override_file_sorter = true,
   -- }
  }
}
require('telescope').load_extension('fzf')
require("telescope").load_extension("git_worktree")

EOF

nnoremap <silent> <Leader>l <cmd>Telescope current_buffer_fuzzy_find<cr>
nnoremap <silent> <Leader>f <cmd>Telescope live_grep<cr>
nnoremap <silent> <C-b>     <cmd>Telescope buffers<cr>
nnoremap <silent> <C-F>     <cmd>Telescope find_files<cr>
nnoremap <silent> te        <cmd>Telescope<cr>
nnoremap <silent> <Leader>h <cmd>Telescope oldfiles<cr>
nnoremap <silent> <leader>F :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
vnoremap <silent> <leader>f y:lua require('telescope.builtin').grep_string({search = vim.fn.getreg('"')})<CR>

nnoremap <silent> <Leader>gwt :lua require('telescope').extensions.git_worktree.git_worktrees()<cr>
                                " -- <Enter> - switches to that worktree
                                " -- <c-d> - deletes that worktree
                                " -- <c-D> - force deletes that worktree
