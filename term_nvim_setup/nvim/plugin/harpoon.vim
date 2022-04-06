nnoremap <silent> <Leader>a      :lua require("harpoon.mark").add_file()<cr>
nnoremap <silent> <Leader>m      :lua require("harpoon.ui").toggle_quick_menu()<cr>
nnoremap <silent> <Leader>1      :lua require("harpoon.ui").nav_file(1)<cr>  
nnoremap <silent> <Leader>2      :lua require("harpoon.ui").nav_file(2)<cr> 
nnoremap <silent> <Leader>3      :lua require("harpoon.ui").nav_file(3)<cr> 
nnoremap <silent> <Leader>4      :lua require("harpoon.ui").nav_file(4)<cr>  
nnoremap <silent> <Leader>5      :lua require("harpoon.ui").nav_file(5)<cr>  
nnoremap <silent> <Leader>6      :lua require("harpoon.ui").nav_file(6)<cr>  
nnoremap <silent> <Leader>7      :lua require("harpoon.ui").nav_file(7)<cr>  
nnoremap <silent> <Leader>8      :lua require("harpoon.ui").nav_file(8)<cr>  
nnoremap <silent> <Leader>9      :lua require("harpoon.ui").nav_file(9)<cr>  

lua << EOF
require("harpoon").setup({
global_settings = {
    save_on_toggle = false,
    save_on_change = true,
    enter_on_sendcmd = false,
    excluded_filetypes = { "harpoon" }
        },
menu = {
        height = 20,
        width = 80
        }
})
EOF
