nnoremap  <silent> <S-l> <Plug>vem_next_buffer-
nnoremap  <silent> <S-h> <Plug>vem_prev_buffer-

" Close buffer without close the pane
nnoremap ,c :bp<bar>sp<bar>bn<bar>bd<CR>
nnoremap <silent> <leader>bo :w <bar> %bd <bar> e# <bar> bd# <CR><CR>

" Close all buffers but the current
nnoremap <silent> ;c :w <bar> %bd <bar> e# <bar> bd# <CR><CR>

" Toggle vimwiki syntax and filetype
nnoremap tv :set syntax=vimwiki filetype=vimwiki<CR>
nnoremap tm :set syntax=markdown filetype=markdown<CR>

" Narrow
vnoremap ;r :Narrow<CR>
vnoremap ;w :Widen<CR>

" FZF
nnoremap <c-p> :Files <CR>
nnoremap <c-f> :Rgi <CR>
nnoremap <leader>l :BLines<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <silent> ,d :call fzf#run(fzf#wrap({'source': 'find $HOME/projects -maxdepth 2 -type d'}))<CR>
nnoremap <leader>f :Rgi <C-R><C-W><CR>
vnoremap <leader>f "ay:Rgi <C-r>a<CR>

" Generate helptags for vim doc
nnoremap <leader>h :helptags ~/.vim/doc<CR>

nnoremap <leader>p :!clear && node %<CR>
