set nocompatible
filetype off

"vim colors
set t_Co=256
"let base16colorspace=256   Access colors present in 256 colorspace"

" set the runtime path to include Vundle and initialize
 set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'plasticboy/vim-markdown'
Plugin 'scrooloose/syntastic'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'lepture/vim-jinja'
Plugin 'fisadev/fisa-vim-colorscheme'
Plugin 'fisadev/FixedTaskList.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'ervandew/supertab'
Plugin 'klen/python-mode'
Plugin 'Lokaltog/vim-distinguished'
Plugin 'chriskempson/base16-vim'
Plugin 'wannesm/wmgraphviz.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins

"Map keyboard movements
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

"Syntax Highlighting and validation
syntax on                           " syntax highlighing
highlight clear
filetype on                          " try to detect filetypes
filetype plugin indent on    " enable loading indent file for filetype
filetype plugin on

"Python tabs
set textwidth=79
set tabstop=4
set expandtab
set shiftwidth=4
set softtabstop=4
set shiftround
set autoindent
set colorcolumn=79

"Python general
let g:python_slow_sync=1
"
""python-mode
let g:pymode_rope_completion=1
let g:pymode_rope_completion_on_dot=1
let g:pymode_rope_autoimport=1
let g:pymode_trim_whitespaces=1
let g:python_highlight_all = 1
let g:pymode_virtualenv=1
let g:pymode_breakpoint=1
let g:pymode_doc=0

"Vim tab navigation better
map <F4> :tabp<CR>
map <F5> :tabn<CR>

"Pending task list
map <F6> :TaskList<CR>

"Tagbar display
map <F3> :TagbarToggle<CR>
let g:tagbar_autofocus = 1

"PymodeLint options
let g:pymode_lint_on_write = 1
let g:pymode_lint_checkers = ['pep8', 'pyflakes', 'pylint']
let g:pymode_lint_signs = 1

"airline laststatus
set laststatus=2

"NerdTree mapping
map <F2> :NERDTreeToggle<CR>

"Auto flake8 check at writing
autocmd BufWritePost *.py call Flake8()

"IPDB import statement
autocmd FileType python ab ip from ipdb import set_trace; set_trace()  # BREAKPOINT

"GUI
set showtabline=2
set title
set background=dark
set smartindent
set showmatch
set showmode

"Search
set ignorecase
set hlsearch
set incsearch
nmap <silent> ,, :nohlsearch<cr>

"Backspace
set backspace=2
set backspace=indent,eol,start

" Synstastic Statusline
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Avoid annoying documentation window
set completeopt=menu
