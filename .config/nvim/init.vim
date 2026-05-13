set mouse=
set mousemodel=popup
set autoindent expandtab tabstop=2 shiftwidth=2
colo desert
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

function! RunMmdcIfMermaid()
  if search('```mermaid', 'nw') > 0
    call system('mmdc -i ' . shellescape(expand('%')) . ' -e png &')
  endif
endfunction

augroup mermaid_render
  autocmd!
  autocmd BufWritePost *.md call RunMmdcIfMermaid()
augroup END
