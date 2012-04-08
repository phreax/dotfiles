function! JavaScriptFold()
    setl foldmethod=syntax
    setl foldlevelstart=1
    syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

    function! FoldText()
        return substitute(getline(v:foldstart), '{.*', '{...}', '')
        endfunction
    setl foldtext=FoldText()
endfunction


" au FileType javascript call JavaScriptFold()
setl fen
setl nocindent
set shiftwidth=2
set tabstop=2 

imap <c-t> AJS.log();<esc>hi
imap <c-a> alert();<esc>hi

inoremap <buffer> $r return
inoremap <buffer> $f //--- PH ----------------------------------------------<esc>FP2xi
