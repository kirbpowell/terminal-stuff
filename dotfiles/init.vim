" Author: Kirby Powell
"
" This is my personal init.vim. It's got a lot of plugins etc
" to make #ViMlyfe a bit easier and sane.
"
""""""""""""""""""""""""""""
""""    vim-plug Stuff    """"
"""" THIS MUST BE FIRST """"
""""                    """"
""""""""""""""""""""""""""""

set nocompatible		            " set iMproved

" initialize vim-plug
call plug#begin('~/.vim/plugged')

"""" BEGIN list of plugins

"vim airline!
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"NerdTree
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'

"Plugs for use w/ Git. Git-gutter/Git-fugitive
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

"delimitMate - insert matching delimiters!
Plug 'Raimondi/delimitMate'

"Extensions for showing tags, generating tagfiles, etc`
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'
Plug 'majutsushi/tagbar'

"deals with manpages and tmux
Plug 'jez/vim-superman'

"tmux navigator - useful with nerdtree etc aswell
Plug 'christoomey/vim-tmux-navigator'

"auto-close HTML tags
Plug 'vim-scripts/HTML-AutoCloseTag'

"Highlight / strip trailing whitespace
Plug 'ntpeters/vim-better-whitespace'

"syntax highlighting etc for LaTeX
Plug 'lervag/vimtex'

"Better commment macros etc
Plug 'scrooloose/nerdcommenter'

"Code folding!
Plug 'tmhedberg/SimpylFold'

"Code search
Plug 'mileszs/ack.vim'

"Rainbow Parentheses
Plug 'luochen1990/rainbow'

"Nord Colorscheme
Plug 'nordtheme/vim'

"Better lineno/relative lineno stuff
Plug 'jeffkreeftmeijer/vim-numbertoggle'

"PEP8 aware indentation for Python
Plug 'Vimjas/vim-python-pep8-indent'

"ALE - Async Linter Enginer
Plug 'dense-analysis/ale'

"Better python syntax highlighting w/ semshi
Plug 'numirias/semshi'

"CoC - Code completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"""" END list of plugins
call plug#end()


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
"
"""""""""""""""""""""
"       A.L.E       "
"""""""""""""""""""""
let g:ale_fixers = {
\    '*': ['remove_trailing_lines', 'trim_whitespace'],
\    'javascript': ['prettier', 'eslint'],
\    'python': ['black', 'isort'],
\}
let g:ale_fix_on_save = 1  "automatically run ALE on file save.
let g:ale_python_black_options = '--line-length 88'
let g:ale_python_isort_options = '-profile black -fss -fass'

"""""""""""""""""""""
"                   "
"       CoC         "
"                   "
"""""""""""""""""""""
set hidden          " seems to be necessary

set nobackup        " backups seem to mess w/ coc
set nowritebackup

set cmdheight=2     " more room for coc to show stuff

set updatetime=300  " suggested default value

set shortmess+=c

" stop vim from changing the left column, if possible
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Tell CoC where to find Python
autocmd FileType python let b:coc_root_patterns = ['.git', '.env', 'venv', '.venv', 'setup.cfg', 'setup.py', 'pyproject.toml']

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

"disable unused providers
let g:loaded_python_provider = 0
let g:loaded_ruby_provider = 0
let g:loaded_node_provider = 0
let g:loaded_perl_provider = 0
