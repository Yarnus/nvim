setlocal expandtab
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal autoindent
match BadWhitespace /^\t\+/
match BadWhitespace /\s\+$/
setlocal fileformat=unix
