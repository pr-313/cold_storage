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

" ----------------------- END TAGBAR ---------------
