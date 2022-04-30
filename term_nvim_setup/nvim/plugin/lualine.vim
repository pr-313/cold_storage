lua << EOF
require'lualine'.setup {
  options = {
    icons_enabled = false,
    theme = 'auto',
    component_separators = {'|', '|'},
    section_separators = {'|', '|'},
    disabled_filetypes = {},
    globalstatus = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'FugitiveHead'},
    lualine_c = {{'filename', 
                    path = 1}},
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
