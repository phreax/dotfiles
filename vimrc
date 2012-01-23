" My custom vim config file 
"
" Maintainer:   phreax 	
" Last change:  2011, 09.03.	
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
finish
endif

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

set autoindent		" always set autoindenting on
" Make shift-insert work like in Xterm
"set mouse=a
"set mousemodel="popup"

map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>                                                              

map <MouseDown> <C-Y>
map <S-MouseDown> <C-U>
map <MouseUp> <C-E>
map <S-MouseUp> <C-D>

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map space to / (search) and c-space to ? (backwards search)
map <space> /
map <C-space> ?
" Smart way to move btw. windows
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-h> <C-W>h
nmap <C-l> <C-W>

" navigation between buffers
map h :bp!<CR>
map l :bn!<CR>

""""""""""""""""""""""""""""""
" => bufExplorer plugin
""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
map <leader>o :BufExplorer<cr>

set mouse=a
set ttymouse=xterm

""""""""""""""""""""""""""""""
" => Minibuffer plugin
""""""""""""""""""""""""""""""
" let g:miniBufExplModSelTarget = 1
" let g:miniBufExplorerMoreThanOne = 2
" let g:miniBufExplModSelTarget = 0
" let g:miniBufExplUseSingleClick = 1
" let g:miniBufExplMapWindowNavVim = 1
" let g:miniBufExplVSplit = 20
" let g:miniBufExplSplitBelow=1

let g:bufExplorerSortBy = "name"

autocmd BufRead,BufNew :call UMiniBufExplorer

map <leader>u :TMiniBufExplorer<cr>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

"Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=



" Fast saving
nmap <leader>w :w!<cr>

" closing a buffer
nmap <leader>x :bd<cr>

" closeing a window
nmap <leader>q :q<cr>

" Fast editing of the .vimrc
map <leader>e :e! ~/.vimrc<cr>

" remap left, right

" toggle paste mode
set pastetoggle=<F10>



" toggle search highlighting 
function! ToggleHLSearch()
if &hls
    set nohls
else
    set hls
endif
endfunction

nmap <silent> <C-n> <esc>:call ToggleHLSearch()<CR>

" When vimrc is edited, reload it
autocmd! bufwritepost .vimrc source ~/.vimrc

" hotkey for command-T
map <Leader>t :CommandT<CR>

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
set nobackup		" do not keep a backup file, use versions instead
else
set backup		" keep a backup file
endif
set history=200		" keep 50 lines of command line history
set ruler		    " show the cursor position all the time
set showcmd		    " display incomplete commands
set incsearch		" do incremental searching
set wildmenu        " better cmd tab menu
set number

" When pressing <leader>cd switch to the directory of the open buffer
map <leader>d :cd %:p:h<cr>

" Don't use Ex mode, use Q for formatting
map Q gq

" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
syntax on
set hlsearch

" Set tab
set shiftwidth=4
set expandtab
set tabstop=4
set autoindent

" set tagfile
let &tags = ".tags"
set tagstack  " Record tag moves so that ctrl+T pops back

" Set color
set t_Co=256
" colorscheme dante 

let g:solarized_termcolors=256
set background=dark
colorscheme solarized
                             
"hi CursorLine   cterm=NONE term=NONE  ctermbg=24
hi CursorLine   cterm=NONE term=NONE  ctermbg=235
hi StatusLineNC    ctermfg=232 ctermbg=238
hi StatusLine    ctermfg=233 ctermbg=238
"hi StatusLineNC    ctermfg=84 ctermbg=236
"hi StatusLine    ctermfg=83 ctermbg=236
"hi Comment       ctermfg=59
hi String        ctermfg=142
"hi Search        ctermbg=118
"hi Pmenu         ctermbg=118 ctermfg=23
"hi PmenuSel         ctermfg=118 ctermbg=23
"hi PmenuSbar    ctermbg=118 
""hi PmenuThumb    ctermfg=23
"hi Visual       ctermfg=238  term=None

""""""""""""""""""""""""""""""
" => Statusline
""""""""""""""""""""""""""""""
" Always hide the statusline
                              
" Format the statusline

function! CurDir()
let curdir = substitute(getcwd(), '/home/pyth0n/', "~/", "g")
return curdir
endfunction

function! HasPaste()
if &paste
    return 'PASTE MODE  '
else
    return ''
endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Parenthesis/bracket expanding
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   vnoremap $1 <esc>`>a)<esc>`<i(<esc>
"   vnoremap $2 <esc>`>a]<esc>`<i[<esc>
"   vnoremap $3 <esc>`>a}<esc>`<i{<esc>
"   vnoremap $$ <esc>`>a"<esc>`<i"<esc>
"   vnoremap $q <esc>`>a'<esc>`<i'<esc>
"   vnoremap $e <esc>`>a"<esc>`<i"<esc>

" Map auto complete of (, ", ', [
"   inoremap $1 ()<esc>i
"   inoremap $2 []<esc>i
"   inoremap $3 {}<esc>i
"   inoremap $4 {<esc>o}<esc>O
"   inoremap $q ''<esc>i
"   inoremap $e ""<esc>i
"   inoremap $t <><esc>i

" Persistent undo
try
set undodir=~/.vim/undodir
set undofile
catch
endtry

" mapping for line numbers

function! ToggleNumbers()
if &number
    F
    F
    set nonumber
else
    set number
endif
endfunction

nmap <F12> :call ToggleNumbers()<CR>

""""""""""""""""""""""""""""""
" => JavaScript section
"""""""""""""""""""""""""""""""
" au FileType javascript call JavaScriptFold()
au FileType javascript setl fen
au FileType javascript setl nocindent
au FileType javascript set shiftwidth=2
au FileType javascript set tabstop=2 

au FileType javascript imap <c-t> AJS.log();<esc>hi
au FileType javascript imap <c-a> alert();<esc>hi

au FileType javascript inoremap <buffer> $r return
au FileType javascript inoremap <buffer> $f //--- PH ----------------------------------------------<esc>FP2xi

function! JavaScriptFold()
setl foldmethod=syntax
setl foldlevelstart=1
syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

function! FoldText()
return substitute(getline(v:foldstart), '{.*', '{...}', '')
endfunction
setl foldtext=FoldText()
endfunction

" CoffeScript
let coffee_compile_on_save = 1
au FileType coffee vmap <Leader>c :CoffeeCompile<CR>
au FileType coffee set shiftwidth=2
au FileType coffee set tabstop=2 


" autocompletion config

setlocal omnifunc=javacomplete#Complete 

setlocal completefunc=javacomplete#CompleteParamsInfo
inoremap <buffer> <C-X><C-U> <C-X><C-U><C-P>
" inoremap <buffer> <C-S-Space> <C-X><C-U><C-P>

" set cursorline highlighting (for gui only)
set cursorline 

autocmd Filetype java setlocal omnifunc=javacomplete#Complete
" Enable file type detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on


" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
au!

" For all text files set 'textwidth' to 78 characters.
autocmd FileType text setlocal textwidth=78

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif


