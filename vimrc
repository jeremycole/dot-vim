set viminfo='100,\"100,:200,%,n~/.viminfo
set number
set gfn=Monospace\ 13

map q :q<CR>
map m :TlistToggle<CR>
map f :execute "grep -rn --include=*.{c,cc,h,ic,i,rb} --exclude=tags --exclude-dir=storage/xtradb " . expand("<cword>") . " *" <Bar> cw<CR><CR>

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
set list

set pastetoggle=<C-e>
set tabstop=8
set shiftwidth=2
set expandtab
set autoindent
set smartindent

"Check for InnoDB files.
autocmd FileType c,cpp call CheckForInnodbConfiguration()

"Setup InnoDB coding style
function! CheckForInnodbConfiguration()
  if expand('%:p') =~ 'innobase'
    setlocal tabstop=8
    setlocal softtabstop=8
    setlocal shiftwidth=8
    setlocal textwidth=80
    setlocal noexpandtab
    syn keyword cOperator likely unlikely
    syn keyword cType ulint ullint
  endif
endfunction

execute pathogen#infect()
syntax on
filetype plugin indent on
