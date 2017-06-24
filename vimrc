let mapleader = "\<Space>"
map <leader>4 $

imap OO <C-O>o<Esc>
inoremap DD <Esc>dd
inoremap UU <Esc>u

nnoremap <D-F> :Ag<space>

nmap :s :%s
nmap <leader>O O<Esc>
nmap <leader>o o<Esc>
nmap <leader>nt :NERDTreeToggle<CR>
nmap <leader>n :NERDTreeFind<CR>
nmap <leader>p <C-^>
nmap <leader>w  :ZoomWin<CR>
nmap <leader>vs :vsp<CR>
nmap <leader>sp :sp<CR>
nmap <leader>sp :sp<CR>
nmap <leader>5 %
nmap :norm :%norm A
nmap :I :%norm I
nmap dfd "_dd

nmap ys' ysiw'
nmap ys" ysiw"
nmap ys) ysiw)
nmap ys} ysiw}
nmap ys[ ysiw[

nmap tab= :Tabularize /=<CR>
nmap tab: :Tabularize /:\zs<CR>

nmap <leader>jj <C-w>j
nmap <leader>kk <C-w>k
nmap <leader>hh <C-w>h
nmap <leader>ll <C-w>l

:set iskeyword-=_
:set vb t_vb=
filetype plugin indent on
set tabstop=2 " <tab> inserts 2 spaces
set nowrap " don't wrap text
set backspace=2 " allow backspacing over autoindent, BOL, EOL
set shiftwidth=2 " indent level is 2 spaces wide
set expandtab " use spaces not tabs for autoindent/tab key

" Searching
set smarttab
set ignorecase " default to case insensitive searches

" Display
set guifont=Bitstream\ Vera\ Sans\ Mono:h14
colorscheme neon

"set wildmode=longest,list,full
"set wildmenu                              " Enable ctrl-n and ctrl-p to scroll thru matches
set wildignore+=log
set wildignore=.DS_Store,*.o,*.obj,*~     " Stuff to ignore when tab completing
set wildignore+=*/.bundle/*,*/.git/*
set wildignore+=*/.sass-cache/*,*/tmp/*
set wildignore+=tags,tmp/**,build/**
set wildignore+=*vim/backups*,argfile*,*/out/*
set wildignore+=*coverage/*
let g:ctrlp_working_path_mode = 'a'
let g:ctrlp_match_func = { 'match' : 'matcher#cmatch' }

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

"folding settings
set nofoldenable
