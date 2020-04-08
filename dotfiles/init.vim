" Author: Kirby Powell
"
" This is my personal init.vim. It's got a lot of plugins etc
" to make #ViMlyfe a bit easier and sane.
"
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

"""" BEGIN list of plugins

"vundle needs to be able to manage itself
Plugin 'VundleVim/Vundle.vim'

"vim airline!
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

"NerdTree
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'

"Plugins for use w/ Git. Git-gutter/Git-fugitive
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'

"delimitMate - insert matching delimiters!
Plugin 'Raimondi/delimitMate'

"Extensions for showing tags, generating tagfiles, etc`
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
Plugin 'majutsushi/tagbar'

"deals with manpages and tmux
Plugin 'jez/vim-superman'

"tmux navigator - useful with nerdtree etc aswell
Plugin 'christoomey/vim-tmux-navigator'

"auto-close HTML tags
Plugin 'HTML-AutoCloseTag'

"Highlight / strip trailing whitespace
Plugin 'ntpeters/vim-better-whitespace'

"syntax highlighting etc for LaTeX
Plugin 'lervag/vimtex'

"Better commment macros etc
Plugin 'scrooloose/nerdcommenter'

"Code folding!
Plugin 'tmhedberg/SimpylFold'

"Code search
Plugin 'mileszs/ack.vim'

"Rainbow Parentheses
Plugin 'luochen1990/rainbow'

"Nord Colorscheme
Plugin 'arcticicestudio/nord-vim'

"Better lineno/relative lineno stuff
Plugin 'jeffkreeftmeijer/vim-numbertoggle'

"PEP8 aware indentation for Python
Plugin 'Vimjas/vim-python-pep8-indent'

"ALE - Async Linter Enginer
Plugin 'dense-analysis/ale'

"Better python syntax highlighting w/ semshi
Plugin 'numirias/semshi'

"""" END list of plugins

call vundle#end()		    "required for vundle
filetype plugin indent on	"also required for vundle

""""""""""""""""""""
" Airline          "
"       Settings   "
""""""""""""""""""""
" Airline requires a 'patched' font
""""""""""""""""""""
let g:airline_powerline_fonts = 1
let g:airline_detect_paste = 1
let g:airline#extensions#tabline#enabled = 1

"""""""""""""""""""""
"     NerdTree      "
"     Settings      "
"""""""""""""""""""""

"allows us to open NERDTree tabs with '\t'
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>

""""""""""""""""""""
" git-gutter       "
"        settings  "
""""""""""""""""""""
let g:airline#extensions#hunks#non_zero_only = 1    "only show in airline iff diff != zero

"""""""""""""""""""""
" delimitMate       "
"       settings    "
"""""""""""""""""""""
let delimitMate_expand_cr = 1
augroup mydelimitMate           "tells delimitMate what things to delimit
    au!
    au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
    au FileType tex let b:delimitMate_quotes = ""
    au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
    au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END

"""""""""""""""""""""
"    Easy Tags      "
"""""""""""""""""""""
set tags=./tags;,~/.vimtags         "tell vim where to look for tags
"set some sane defaults
let g:easytags_events =  ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1

"""""""""""""""""""""
"      tagbar       "
"""""""""""""""""""""
nmap <silent> <leader>b :TagbarToggle<CR>
" lets us open/close tagbar with \b

"""""""""""""""""""""
"     superman      "
"""""""""""""""""""""
noremap K :SuperMan <cword><CR>
"man pagees in ViM
"you also need a .bashrc thing. Ask Kirby for it

"""""""""""""""""""""
"     ViMTeX        "
"""""""""""""""""""""
let g:vimtex_view_method = 'skim'   "set the pdf viewer to skim, a lightweight pdf viewer
let maplocalleader = "\\"           "set the localleader to \, for reasons.
let g:vimtex_compiler_progname = 'nvr'

"""""""""""""""""""""
"  NERD Commenter   "
"""""""""""""""""""""
let g:NERDSpaceDelims = 1           " add spaces after comment delimiter by default
let g:NERDDefaultAlign = 'left'     " align comments to the left by default
let g:NERDCommentEmptyLines = 1     " allow NERDComment to comment emptys

"""""""""""""""""""""
" Vim Better        "
"       Whitespace  "
"""""""""""""""""""""
autocmd BufEnter * EnableStripWhitespaceOnSave

"""""""""""""""""""""
"    SimpylFold     "
"""""""""""""""""""""
let g:SimpylFold_docstring_preview=1
set foldlevel=99

"""""""""""""""""""""
"    You            "
"      Complete     "
"             Me    "
"""""""""""""""""""""
"let g:ycm_autoclose_preview_window_after_completion=1
"map <leader>g  :YcmCompleter GoToDefinition<CR>
"let g:ycm_python_interpreter_path = ''
"let g:ycm_python_sys_path = []
"let g:ycm_extra_conf_vim_data = [
"  \  'g:ycm_python_interpreter_path',
"  \  'g:ycm_python_sys_path'
"  \]
"let g:ycm_global_ycm_extra_conf = '~/global_extra_conf.py'

"""""""""""""""""""""
"     Ack Code      "
"      Search       "
"""""""""""""""""""""
let g:ackprg = 'ag --nogroup --nocolor --column'

"""""""""""""""""""""
"   Rainbow Parens  "
"""""""""""""""""""""
let g:rainbow_active = 1

"""""""""""""""""""""
"                   "
"  General Settings "
"                   "
"""""""""""""""""""""

set t_Co=256                        "make sure vim knows we can use 256 colors
colorscheme nord                    "Kirby's preferred colorscheme
set cursorline                      "underlines the current line
set ruler                           "sets the bottom right ruler
set showcmd                         "shows the last command entered on last line
set incsearch                       "enables incremental search
set hlsearch                        "enables search highlighting
set ignorecase                      "ignore case by default in search
set smartcase                       "context sensitive case insensitive search
set nu rnu                          "enables line numbers
set mouse=a                         "enables the mouse in ViM
set showmatch                       "highlights the bracket that matches the one you've got selected
set autochdir                       "set working dir to current file
set tabstop=4                       "sets how many spaces a tab is
set shiftwidth=4                    "number of spaces in an autoindent
set smarttab                        "makes <tab> respect shiftwidth
set expandtab                       "makes tabs spaces
set backspace=indent,eol,start      "makes backspace more sane
syntax on                           "enable syntax highlighting
set laststatus=2                    "always display the status line
set splitbelow                      "open new horizontal splits BELOW the current file
set splitright                      "open new vertical splits RIGHT of the current file

"set the localleader to the space bar, because it's way better.
map <space> <leader>

"use <space><space> to clear search highlighting
nnoremap <Leader><space> :noh<cr>
