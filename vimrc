" Startup Pathogen
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()


set noesckeys
set autoindent
set smartindent

set pastetoggle=<F2>

set tabstop=4
set shiftwidth=4
set expandtab

set nocompatible " explicitly get out of vi-compatible mode

set noexrc " don't use local version of .(g)vimrc, .exrc

set background=dark " we plan to use a dark background

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

syntax on " syntax highlighting on

set backspace=indent,eol,start " make backspace a more flexible
"set backup " make backup files 
set directory=~/.vim/tmp " directory to place swap files in
set fileformats=unix,dos,mac " support all three, in this order
set iskeyword+=_,$,@,%,# " none of these are word dividers 
set mouse=a " use mouse everywhere
set noerrorbells " don't make noise

set cursorline " highlight current line
set incsearch " BUT do highlight as you type you 
set laststatus=2 " always show the status line
set linespace=0 " insert extra pixel lines 

set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]
set number " turn on line numbers

" Set tab and shift-tab for moving between tabs
nmap <Tab> gt
nmap <S-Tab> gT

