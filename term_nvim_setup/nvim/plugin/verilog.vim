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

