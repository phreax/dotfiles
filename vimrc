" My custom vim config file 
"
" Maintainer:   phreax 	
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
finish
endif

" init pathogen
" call pathogen#runtime_append_all_bundles()
" call pathogen#helptags()

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" don't enforce saving before switching buffers
set hidden

" save backup files *~ in this directory
set backupdir=~/.vimbackups

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
nmap <C-l> <C-W>l

map  :bp!<CR>
map  :bn!<CR>

" Create new file in the current directory
nmap <leader>f :e <C-R>=expand('%:h')<CR>/

""""""""""""""""""""""""""""""
" => bufExplorer plugin
""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
map <leader>o :BufExplorer<cr>

"xterm mouse with middleclick paste
nnoremap <MiddleMouse> i<MiddleMouse>
noremap <MiddleMouse> s<MiddleMouse>

set pastetoggle=<F7>

" Make shift-insert work like in Xterm
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>                                                              

map <S-MouseDown> <C-U>
map <MouseUp> <C-E>
map <S-MouseUp> <C-D>

let g:sparkupExecuteMapping = '<c-e>'

"choose either one
set ttymouse=xterm

" fix moues copy paste to work in xterm
set mouse=r
set mousemodel="xterm"

" Unbind the cursor keys in insert, normal and visual modes.
"   for prefix in ['i', 'n', 'v']
"     for key in ['<Up>', '<Down>', '<Left>', '<Right>', '<PageUp>', '<PageDown>', '<End>']
"       exe prefix . "noremap " . key . " <Nop>"
"     endfor
"   endfor

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

nnoremap ; :
vnoremap ; :

" clear highlight searc
nmap <silent> <leader>/ :nohlsearch<CR>

" Neosnippet

let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#disable_runtime_snippets = {
        \   '_' : 1,
        \}
let g:neosnippet#snippets_directory='~/.vim/snippets'

" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)

imap <expr><TAB>
      \ pumvisible() ? "\<C-n>" :
      \ neosnippet#expandable_or_jumpable() ?
      \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" Edit Snippets
nmap <leader>n :NeoSnippetEdit<CR>


" Fast saving
nmap <leader>w :w!<cr>

" closing a buffer
nmap <leader>x :bd<cr>

" closeing a window
nmap <leader>q :q<cr>

" Fast editing of the .vimrc
nmap <leader>e :e! ~/.vimrc<cr>
nmap P +A


" toggle search highlighting 
function! ToggleHLSearch()
if &hls
    set nohls
else
   set hls
endif
endfunction

" nmap <silent> <C-n> <esc>:call ToggleHLSearch()<CR>
"
function! ToggleRelativeNumbers()
if &rnu
    set number
    set nornu
else
    set nonumber
    set rnu
endif
endfunction


set nonumber
set rnu
nmap <leader>r :call ToggleRelativeNumbers()<CR>

" When vimrc is edited, reload it
autocmd! bufwritepost .vimrc source ~/.vimrc

let g:ctrlp_map = '<Leader>t'
let g:ctrlp_match_window_bottom = 1
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend|sqlite|aux|log|toc)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py|DS_Store|node_modules'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_dotfiles = 0
let g:ctrlp_switch_buffer = 0


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

" When pressing <leader>cd switch to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>
map <leader>d :LustyJuggler<cr>


" Don't use Ex mode, use Q for formatting
map Q gq

" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
let python_highlight_all=1
syntax on
set hlsearch

" Set tab
set shiftwidth=4
set expandtab
set tabstop=4

" set tagfile
let &tags = ".tags"
set tagstack  " Record tag moves so that ctrl+T pops back

""let g:solarized_termcolors=16
let g:solarized_termtrans=0
set background=dark
                             
colorscheme solarized
hi StatusLine     cterm=bold ctermbg=8
hi StatusLineNC    cterm=bold ctermfg=1 ctermbg=0

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
" au FileType javascript setl fen
" au FileType javascript setl nocindent
" au FileType javascript set shiftwidth=2
" au FileType javascript set tabstop=2 
"
" au FileType javascript imap <c-t> AJS.log();<esc>hi
" au FileType javascript imap <c-a> alert();<esc>hi
" au FileType javascript inoremap <buffer> $f //--- PH ----------------------------------------------<esc>FP2xi
"
" function! JavaScriptFold()
" setl foldmethod=syntax
" setl foldlevelstart=1
" syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend
"
" function! FoldText()
" return substitute(getline(v:foldstart), '{.*', '{...}', '')
" endfunction
" setl foldtext=FoldText()
" endfunction
"
" CoffeScript
let coffee_compile_on_save = 1
au FileType coffee vmap <Leader>c :CoffeeCompile<CR>
au FileType coffee set shiftwidth=2
au FileType coffee set tabstop=2 
au FileType coffee 
      \map <Leader>m :silent CoffeeMake! -b <bar> cwindow <bar> redraw!<CR>


" Syntastic
" let g:syntastic_python_checkers=['pyflakes']
" if exists("loaded_coffe_syntax_checker")
"   finish
" endif
" let loaded_coffe_syntax_checker = 1
"
" let g:syntastic_cpp_compiler = 'clang++'
" let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
"
"

" closetag
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.erb,*.jsx,*.js'

"bail if the user doesnt have coffee-script installed
if !executable("coffee")
  finish
endif

" Switched syntax checker to ale
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" function! SyntaxCheckers_coffee_GetLocList()
"   let errorformat =  '%EError: In %f\, Parse error on line %l: %m,%Z%p^,%W%f:%l: warning: %m'
"
"   return SyntasticMake({ 'makeprg': 'coffee -o /tmp -c %', 'errorformat': errorformat })
" endfunction

" Ale
set nocompatible
filetype off

let &runtimepath.=',~/.vim/bundle/ale'
let g:ale_linters = {
            \   'python': ['flake8'],
            \   'jsx': ['eslint']
            \}
let g:ale_python_flake8_args = "--ignore=E501"

let g:ale_linter_aliases = {'jsx': 'css'}

filetype plugin on

" Jedi
let g:jedi#popup_on_dot = 0
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#show_function_signatures = "0"


" Do not show `User defined completion (^U^N^P) Pattern not found`
set shortmess+=c

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_auto_trigger = 1

" Neocomplete
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 2
" Bind tab for completion
let g:neocomplete#enable_auto_close_preview=1
" let g:neocomplete#force_omni_input_patterns = {
"     \ 'javascript': '[^. \t]\.\w*'
"     \}
let g:neocomplete#fallback_mappings =
        \ ["\<C-x>\<C-o>", "\<C-x>\<C-n>"]

autocmd FileType javascript setlocal omnifunc=tern#Complete

" buftabline
let g:buftabline_show = 1 " only show when at least 2 buffers are open
let g:buftabline_numbers = 2
let g:buftabline_indicators = 1
nmap <leader>1 <Plug>BufTabLine.Go(1)
nmap <leader>2 <Plug>BufTabLine.Go(2)
nmap <leader>3 <Plug>BufTabLine.Go(3)
nmap <leader>4 <Plug>BufTabLine.Go(4)
nmap <leader>5 <Plug>BufTabLine.Go(5)
nmap <leader>6 <Plug>BufTabLine.Go(6)
nmap <leader>7 <Plug>BufTabLine.Go(7)
nmap <leader>8 <Plug>BufTabLine.Go(8)
nmap <leader>9 <Plug>BufTabLine.Go(9)
nmap <leader>0 <Plug>BufTabLine.Go(10)


" autocompletion config
" setlocal omnifunc=javacomplete#Complete 

" setlocal completefunc=javacomplete#CompleteParamsInfo
inoremap <buffer> <C-X><C-U> <C-X><C-U><C-P>
" inoremap <buffer> <C-S-Space> <C-X><C-U><C-P>

" set cursorline highlighting (for gui only)
set cursorline 

" autocmd Filetype java setlocal omnifunc=javacomplete#Complete

" Enable file type detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on
filetype plugin on

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
au!


" For all text files set 'textwidth' to 78 characters.
autocmd FileType text setlocal textwidth=78
autocmd FileType markdown setlocal textwidth=78
autocmd FileType pandoc setlocal textwidth=78
autocmd FileType tex setlocal textwidth=78

" Always want spellcheck for text files.
set spelllang=en_us
autocmd BufNewFile,BufRead *.txt,*.md,*.markdown setlocal spell
autocmd FileType gitcommit setlocal spell 

let g:markdown_fenced_languages = ['python', 'ruby', 'json', 'javascript']
let g:gfm_syntax_emoji_conceal = 1


" Custom file types

" autocmd FileType python setlocal textwidth=78

" Tagclose for all html-like files
" let g:closetag_html_style=1 
" autocmd FileType html,erb,jst,handlebars source ~/.vim/plugin/closetag.vim 
"
" Powerline settings
set laststatus=2
set encoding=utf-8
let g:Powerline_symbols = 'unicode'

" When editing a file, always jump to the last known cursor position.
"
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif

" Remove trailing whitespaces on save
autocmd FileType ruby,python,haml,javascript,coffee,handlebars,yaml,css,scss autocmd BufWritePre <buffer> :%s/\s\+$//e

" Multi cursor
" let g:multi_cursor_quit_key='<C-c>'
"


"
" Vundle 
"
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" Bundle 'pangloss/vim-javascript'
Bundle 'mxw/vim-jsx'
Bundle 'chase/vim-ansible-yaml'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" fix slow syntax hightlighting
set ttyfast
set lazyredraw
execute pathogen#infect()

" update pathogen helptags
Helptags
