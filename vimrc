let mapleader = "\<Space>"
map <leader>4 $

imap OO <C-O>o<Esc>
inoremap DD <Esc>dd
inoremap UU <Esc>u

nnoremap <D-F> :Ag<space>

nmap :s :%s
nmap <leader>nt :NERDTreeToggle<CR>
nmap <leader>n :NERDTreeFind<CR>
nmap <leader>p <C-^>
nmap <leader>w  :ZoomWin<CR>
nmap <leader>vs :vsp<CR>
nmap <leader>sp :sp<CR>
nmap :norm :%norm A
nmap :I :%norm I
nnoremap <D-/> :call NERDComment(0,"toggle")<C-m>
vnoremap <D-/> :call NERDComment(0,"toggle")<C-m>

nmap ys' ysiw'
nmap ys" ysiw"
nmap ys) ysiw)
nmap ys} ysiw}
nmap ys[ ysiw[

nmap tab= :Tabularize /=<CR>
nmap tab: :Tabularize /:\zs<CR>


:set iskeyword-=_
:set vb t_vb=
set tabstop=2    " <tab> inserts 2 spaces
set nowrap       " don't wrap text
set backspace=2  " allow backspacing over autoindent, BOL, EOL
set shiftwidth=2 " indent level is 2 spaces wide
set expandtab    " use spaces not tabs for autoindent/tab key

" Searching
set hlsearch     " highlight search results
set smarttab
set ignorecase   " default to case insensitive searches

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

let loaded_netrwPlugin = 1 " Do not show netrw description on load

set encoding=utf-8 nobomb " show line numbers
set noswapfile " avoid annoying swap files
set ttyfast " disable error bells
set noerrorbells " disable visual bells


set nocompatible              " be iMproved, required (vundle)
filetype off                  " required (vundle)
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install Pluginins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" git helpers, mostly useful for :GBlame
Plugin 'tpope/vim-fugitive'
" shows git changes (+ for line added, - for line removed) to the left of line numbers
Plugin 'airblade/vim-gitgutter'
" tmux <-> vim swapping
" Plugin 'christoomey/vim-tmux-navigator'
" semi-useful directory tree via F2
Plugin 'scrooloose/nerdtree'
" fuzzy search across all files in directory
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'JazzCore/ctrlp-cmatcher', { 'do': 'CFLAGS=-Qunused-arguments CPPFLAGS=-Qunused-arguments ./install.sh' }
" smart search within all files
Plugin 'rking/ag.vim'
" useful unix commands, move, remove, find, locate
Plugin 'tpope/vim-eunuch'
Plugin 'ReekenX/vim-rename2'
" tmux command runner
Plugin 'jgdavey/tslime.vim'
" comment out lines
Plugin 'scrooloose/nerdcommenter'


" subl-like smart completion of braces
" Plugin 'Raimondi/delimitMate'
" typing autocomplete using lua
" Plugin 'Shougo/neocomplete.vim'
" rspec, run from vim
" Plugin 'thoughtbot/vim-rspec'
" fast multi-cursor editing
" Plugin 'terryma/vim-multiple-cursors'
"
" Syntax
Plugin 'tpope/vim-endwise'
Plugin 'pangloss/vim-javascript'
Plugin 'elzr/vim-json'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rake'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'tpope/vim-markdown'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'editorconfig/editorconfig-vim'

if filereadable(expand("~/.vimrc.bundles.local"))
  source ~/.vimrc.bundles.local
endif

" Done configuring vundle
call vundle#end()
