set viminfo='100,\"100,:200,%,n~/.viminfo
set number
set gfn=Monospace\ 13

map m :TlistToggle<CR>

function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

set listchars=tab:▸\ ,trail:░
",eol:¬
set list

set tabstop=8
set shiftwidth=2
set expandtab

execute pathogen#infect()
syntax on
filetype plugin indent on
