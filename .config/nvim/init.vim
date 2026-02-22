set mouse=
set mousemodel=popup
set autoindent expandtab tabstop=2 shiftwidth=2
colo desert
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

