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
"nmap <leader>w  :ZoomWin<CR>
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

"toggling between window
nmap <leader>jj <C-w>j
nmap <leader>kk <C-w>k
nmap <leader>hh <C-w>h
nmap <leader>ll <C-w>l

nmap tab= :Tabularize /=<CR>
nmap tab: :Tabularize /:\zs<CR>


set foldmethod=indent "fold based on indentation
set nofoldenable "open files with no fold

set iskeyword-=_
set vb t_vb=
set tabstop=2    " <tab> inserts 2 spaces
set nowrap       " don't wrap text
"set backspace=2  " allow backspacing over autoindent, BOL, EOL
set shiftwidth=2 " indent level is 2 spaces wide
"set expandtab    " use spaces not tabs for autoindent/tab key
set number       " show line numbers


"Always show statusline
set laststatus=2
"Show working directory in statusline
set statusline+=%f

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
let g:ctrlp_working_path_mode = 'ra'
  "c - the directory of the current file.
  "a - like "c", but only applies when the current working directory outside of
      "CtrlP isn't a direct ancestor of the directory of the current file.
  "r - the nearest ancestor that contains one of these directories or files:
      ".git .hg .svn .bzr _darcs
let g:ctrlp_lazy_update = 1 "Only update when typing has stopped
let g:ctrlp_match_func = { 'match' : 'matcher#cmatch' } "Replace the built-in matching algorithm.
let g:ctrlp_tabpage_position = 'bc' " open ctrlp match before current tab

 "Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
  let g:ctrlp_max_files=20
endif

let loaded_netrwPlugin = 1 " Do not show netrw description on load

set encoding=utf-8 nobomb " show line numbers
set noswapfile " avoid annoying swap files
set ttyfast " disable error bells
set noerrorbells " disable visual bells

set nocompatible              " be iMproved, required (vundle)
filetype off                  " required (vundle)
" set the runtime path to include Vundle and initialize
" " START - Setting up Vundle - the vim plugin bundler
let vundle_readme=expand('~/.vim/bundle/Vundle.vim/README.md')
let isFirstTimeSoInstallVundle=0
if !filereadable(vundle_readme)
  echo "Installing Vundle.."
  echo ""
  silent !mkdir -p ~/.vim/bundle
  silent !git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  let isFirstTimeSoInstallVundle=1
endif

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
" keep track of recently used files
Plugin 'jeetsukumaran/vim-buffergator'
" subl-like smart completion of braces
Plugin 'Raimondi/delimitMate'
" fast multi-cursor editing
" Plugin 'terryma/vim-multiple-cursors'
"
" Syntax
Plugin 'tpope/vim-endwise'
"Plugin 'elzr/vim-json'
Plugin 'pangloss/vim-javascript'
Plugin 'vim-ruby/vim-ruby'
Plugin 'leafgarland/typescript-vim'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rake'
Plugin 'tpope/vim-sleuth'
Plugin 'posva/vim-vue'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'editorconfig/editorconfig-vim'

" go to file
Plugin 'zoubin/vim-gotofile'
set path=.,src,node_nodules
set suffixesadd=.js,.jsx 

" automatically format files
Plugin 'prettier/vim-prettier'

"linting
Plugin 'w0rp/ale'

if isFirstTimeSoInstallVundle == 1
  PluginInstall
endif

if filereadable(expand("~/.vimrc.bundles.local"))
  source ~/.vimrc.bundles.local
endif

" Done configuring vundle
call vundle#end()
