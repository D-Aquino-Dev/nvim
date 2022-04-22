if exists("g:loaded_vim_google") || &cp || v:version < 700
  finish
endif

let g:loaded_vim_google = 1

if !exists("g:vim_google_open_command")
  if has("win32")
    let g:vim_google_open_command = "start"
  elseif substitute(system('uname'), "\n", "", "") == 'Darwin'
    let g:vim_google_open_command = "open"
  else
    let g:vim_google_open_command = "xdg-open"
  endif
endif

if !exists("g:vim_google_perl_command")
  let g:vim_google_perl_command = "perl"
endif

if !exists("g:vim_google_query_url")
  let g:vim_google_query_url = "http://google.com/search?q="
endif

if !exists("g:vim_google_command")
  let g:vim_google_command = "Google"
endif

if !exists("g:vim_google_f_command")
  let g:vim_google_f_command = g:vim_google_command . "f"   
endif

execute "command! -nargs=* -range ". g:vim_google_command  ." :call s:g('', <f-args>)"
execute "command! -nargs=* -range ". g:vim_google_f_command ." :call s:g(&ft, <f-args>)"

fun! s:g(ft, ...)
  let sel = getpos('.') == getpos("'<") ? getline("'<")[getpos("'<")[2] - 1:getpos("'>")[2] - 1] : ''

  if a:0 == 0
    let words = [a:ft, empty(sel) ? expand("<cword>") : sel]
  else
    let query = join(a:000, " ")
    let quotes = len(substitute(query, '[^"]', '', 'g'))
    let words = [a:ft, query, sel]

    if quotes > 0 && quotes % 2 != 0
      call add(words, '"')
    endif

    call filter(words, 'len(v:val)')
  endif

  let query = substitute(join(words, " "), '^\s*\(.\{-}\)\s*$', '\1', '')
  let query = substitute(query, '"', '\\"', 'g')

  if has('win32')
    " Target command: start "" "<url>"
    silent! execute "! " . g:vim_google_open_command . " \"\" \"" . g:vim_google_query_url  . query . "\""
  else
    silent! execute "! goo_query=\"$(" . g:vim_google_perl_command .
      \" -MURI::Escape -e 'print uri_escape($ARGV[0]);' \"" . query . "\")\" && " .
      \g:vim_google_open_command . ' "' . g:vim_google_query_url . "$goo_query" . '" > /dev/null 2>&1 &'
  endif
  redraw!
endfun
