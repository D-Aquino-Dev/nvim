" All possible highlighters
let g:Hexokinase_highlighters = [
\   'virtual',
\   'background',
\   'backgroundfull',
\ ]

let g:Hexokinase_ftEnabled = ['css', 'html', 'scss', 'javascript', 'typescript', 'typescriptreact', 'javascriptreact', 'lua', 'sh', 'zsh', 'tmux']

" Filetype specific patterns to match
" entry value must be comma seperated list
let g:Hexokinase_ftOptInPatterns = {
\     'css': 'full_hex,rgb,rgba,hsl,hsla,colour_names',
\     'html': 'full_hex,rgb,rgba,hsl,hsla',
\     'javascript': 'full_hex,rgb,rgba,hsl,hsla',
\     'javascriptreact': 'full_hex,rgb,rgba,hsl,hsla',
\     'lua': 'full_hex,rgb,rgba,hsl,hsla',
\     'typescript': 'full_hex,rgb,rgba,hsl,hsla',
\     'typescriptreact': 'full_hex,rgb,rgba,hsl,hsla',
\     'vim': 'full_hex,rgb,rgba,hsl,hsla',
\     'text': 'full_hex,rgb,rgba,hsl,hsla',
\ }
