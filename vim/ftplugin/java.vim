" autocompletion config
setlocal omnifunc=javacomplete#Complete 

setlocal completefunc=javacomplete#CompleteParamsInfo
inoremap <buffer> <C-X><C-U> <C-X><C-U><C-P>
" inoremap <buffer> <C-S-Space> <C-X><C-U><C-P>

" set cursorline highlighting (for gui only)
set cursorline 

autocmd Filetype java setlocal omnifunc=javacomplete#Complete

