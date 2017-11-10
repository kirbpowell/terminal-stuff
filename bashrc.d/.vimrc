""""""""""""""""""""""""""""
""""    Vundle Stuff    """"
"""" THIS MUST BE FIRST """"
""""                    """"
""""""""""""""""""""""""""""

set nocompatible		            " set iMproved
filetype off			            "required for vundle

"set runtimepath to include Vundle and initialize it. 
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"vundle needs to be able to manage itself
Plugin 'VundleVim/Vundle.vim'

"colorschemes plugin
Plugin 'flazz/vim-colorschemes'

"vim airline!
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

"NerdTree
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'

"Syntastic the fantastic syntax checker
Plugin 'vim-syntastic/syntastic'

"Ctrl-P, fuzzy finder for files
Plugin 'ctrlpvim/ctrlp.vim'

"Plugins for use w/ Git. Git-gutter/Git-fugitive
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'

"delimitMate - insert matching delimiters!
Plugin 'Raimondi/delimitMate'

" ALL PLUGINS GO BEFORE THIS
call vundle#end()		"required for vundle
filetype plugin indent on	"also required for vundle

""""""""""""""""""""
" Airline          "
"       Settings   "
""""""""""""""""""""

set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_detect_paste = 1
let g:airline#extensions#tabline#enabled = 1

"""""""""""""""""""""
"     NerdTree      "
"     Settings      "
"""""""""""""""""""""

"allows us to open NERDTree tabs with '\t'
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>

"Open up a NERDTree tab on startup.
let g:nerdtree_tabs_open_on_console_startup = 1

""""""""""""""""""""
" Syntastic        "
"       Settings   "
""""""""""""""""""""
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"
augroup mySyntastic
    au!
    au FileType tex let b:syntastic_mode = "passive"
augroup END

""""""""""""""""""""
" git-gutter       "
"        settings  "
""""""""""""""""""""

"only show in airline iff diff != zero
let g:airline#extensions#hunks#non_zero_only = 1

"""""""""""""""""""""
" delimitMate       "
"       settings    "
"""""""""""""""""""""

let delimitMate_expand_cr = 1
augroup mydelimitMate
    au!
    au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
    au FileType tex let b:delimitMate_quotes = ""
    au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
    au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END

"""""""""""""""""""""
"                   "
"  General Settings "
"                   "
"""""""""""""""""""""

set t_Co=256                        "make sure vim knows we can use 256 colors
colorscheme blacklight              "Kirby's preferred colorscheme
set ruler                           "sets the bottom right ruler
set showcmd                         "shows the last command entered on last line
set incsearch                       "enables incremental search
set hlsearch                        "enables search highlighting
set nu                              "enables line numbers
set mouse=a                         "enables the mouse in ViM
set showmatch                       "highlights the bracket that matches the one you've got selected
set autochdir                       "set working dir to current file 
set tabstop=4                       "sets how many spaces a tab is
set shiftwidth=4                    "number of spaces in an autoindent
set smarttab                        "makes <tab> respect shiftwidth
set expandtab                       "makes tabs spaces
set backspace=indent,eol,start      "makes backspace more sane
syntax on                           "enable syntax highlighting

