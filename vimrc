" Startup Pathogen
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

"set noesckeys
set autoindent
set smartindent

set pastetoggle=<F5>

set tabstop=4
set shiftwidth=4
set expandtab

set nocompatible " explicitly get out of vi-compatible mode

set noexrc " don't use local version of .(g)vimrc, .exrc

syntax enable
syntax on
syntax sync fromstart

let g:solarized_termcolors=256

set background=light

set cpoptions=aABceFsmq
"             |||||||||
"             ||||||||+-- When joining lines, leave the cursor
"             |||||||      between joined lines
"             |||||||+-- When a new match is created (showmatch) 
"             ||||||      pause for .5
"             ||||||+-- Set buffer options when entering the
"             |||||      buffer
"             |||||+-- :write command updates current file name
"             ||||+-- Automatically add <CR> to the last line 
"             |||      when using :@r
"             |||+-- Searching continues at the end of the match 
"             ||      at the cursor position
"             ||+-- A backslash has no special meaning in mappings
"             |+-- :write updates alternative file name
"             +-- :read updates alternative file name


set backspace=indent,eol,start " make backspace a more flexible
set backup " make backup files 
set directory=~/.vim/tmp " directory to place swap files in
set fileformats=unix,dos,mac " support all three, in this order
set iskeyword+=_,$,@,%,# " none of these are word dividers 
set mouse=a " use mouse everywhere
set noerrorbells " don't make noise

set incsearch " BUT do highlight as you type you 
set laststatus=2 " always show the status line
set linespace=0 " insert extra pixel lines 

set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]
set number " turn on line numbers

" Set tab and shift-tab for moving between tabs
nmap <Tab> gt
nmap <S-Tab> gT

" When vimrc is edited, reload it
" if you install this somewhere other than ~/.vim, you'll need to change the
" last argument
autocmd! bufwritepost vimrc source ~/.vim/vimrc
