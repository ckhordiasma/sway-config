set mouse=
set mousemodel=popup
set autoindent expandtab tabstop=2 shiftwidth=2
colo desert
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

function! RunMmdcIfMermaid()
  " Check if buffer contains a mermaid code block
  if search('```mermaid', 'nw') > 0
    silent !mmdc -i % -e png
  endif
endfunction

autocmd BufWritePost *.md call RunMmdcIfMermaid()
