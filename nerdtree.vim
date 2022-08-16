let g:NERDTreeMouseMode = 2
let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrowExpandable = ' ›'
let g:NERDTreeDirArrowCollapsible = ' -'
let g:NERDTreeStatusline = '%#NonText#'
let g:NERDTreeGitStatusNodeColorization = 1
let g:NERDTreeGitStatusWithFlags = 1
let g:NERDTreeWinSize = 30
let g:NERDTreeShowHidden = 1

augroup nerdtreehidecwd
  autocmd!
  autocmd FileType nerdtree setlocal conceallevel=3 | syntax match NERDTreeDirSlash #/$# containedin=NERDTreeDir conceal contained
  autocmd FileType nerdtree setlocal conceallevel=3 | syntax match NERDTreeHideCWD #^[</].*$# conceal
augroup end

nmap <leader>w :NERDTreeFind<CR>
nmap <leader>t :NERDTreeToggle<CR>

