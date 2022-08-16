" Show line numbers
set number 
set relativenumber

" Don't wrap long lines
set nowrap

" Only break lines by words
set linebreak

" Split panes to the right/bottom
set splitright
set splitbelow

" Maximum number of items to show in the popup menu
set pumheight=10

" Work with several buffers
set hidden

" Tabs to spaces
set expandtab

" Correct level of indentation
set shiftwidth=4
set softtabstop=4
set tabstop=4
set autoindent

" Highlight all matches while searching
set incsearch
set hlsearch

" Ignorecase in search pattern
set ignorecase

" Override the 'ignorecase' option if the search pattern contains upper case characters
set smartcase

" Column limits
set cc=60,80,120

" Limit of the line width
set textwidth=80

" Clipboard
set clipboard=unnamed

set nobackup
set noswapfile
set noundofile

" No wrapping text
set nowrap

" Enable mouse
set mouse=a

let mapleader = " "

" Remove tilde emtpy lines char
let &fillchars ..= ',eob: '

set timeoutlen=300

set path+=**
