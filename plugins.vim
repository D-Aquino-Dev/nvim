"Vim Plug --
let vim_plug_installed = 0

let plug_path = expand('$HOME/.vim/autoload/plug.vim')

if !filereadable(plug_path)
  echo " Installing vim-plug --------------------------------------------------------------------------------------------------------------------- "
  silent !mkdir -p $HOME/.vim/autoload
  silent !curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  let vim_plug_installed = 1
endif

" Load vim-plug the first time
if vim_plug_installed
  :execute 'source '.fnameescape(plug_path)
endif

call plug#begin()

Plug 'jiangmiao/auto-pairs'
Plug 'pacha/vem-tabline'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'andymass/vim-matchup'
Plug 'elixir-editors/vim-elixir'
Plug 'godlygeek/tabular'
Plug 'machakann/vim-highlightedyank'
Plug 'matze/vim-move'
Plug 'mg979/vim-visual-multi'
Plug 'mhinz/vim-startify'
Plug 'PhilRunninger/nerdtree-visual-selection'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'scrooloose/nerdcommenter'
Plug 'preservim/nerdtree'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vimoxide/vim-quickscope'
Plug 'wincent/ferret'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'arcticicestudio/nord-vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'vim-pandoc/vim-pandoc'
Plug 'rwxrob/vim-pandoc-syntax-simple'
call plug#end()
