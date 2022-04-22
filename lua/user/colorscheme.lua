vim.cmd [[
try
  let g:dracula_colorterm = 0
  colorscheme nord
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
