" Startup Pathogen
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

"set noesckeys
set autoindent
set smartindent

set pastetoggle=<F5>

set tabstop=4
set shiftwidth=4
set noexpandtab

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
set backupdir=~/.vim/tmp
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

" use two spaces for ruby files
autocmd FileType ruby setlocal tabstop=2 shiftwidth=2 expandtab
" make requires real tabs
autocmd FileType make setlocal noexpandtab shiftwidth=8
" WordPress likes real tabs, so let's assume all php is that way
autocmd FileType php setlocal noexpandtab shiftwidth=4
" Real tabs in JS as well
autocmd FileType js setlocal noexpandtab shiftwidth=4

" For when you forget to sudo.. Really Write the file.
cmap w!! w !sudo tee % >/dev/null

" Map the leader to space
let mapleader = "\<Space>"
" space w = :w
nnoremap <Leader>w :w<CR>
" space q = :q
nnoremap <Leader>q :q<CR>
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" For SVN commit messages turn on spellcheck automatticly
autocmd FileType svn       setlocal spell

" When vimrc is edited, reload it
" if you install this somewhere other than ~/.vim, you'll need to change the
" last argument
autocmd! bufwritepost vimrc source ~/.vim/vimrc
" Return indent (all whitespace at start of a line), converted from
" tabs to spaces if what = 1, or from spaces to tabs otherwise.
" When converting to tabs, result has no redundant spaces.
function! Indenting(indent, what, cols)
  let spccol = repeat(' ', a:cols)
  let result = substitute(a:indent, spccol, '\t', 'g')
  let result = substitute(result, ' \+\ze\t', '', 'g')
  if a:what == 1
    let result = substitute(result, '\t', spccol, 'g')
  endif
  return result
endfunction

" Convert whitespace used for indenting (before first non-whitespace).
" what = 0 (convert spaces to tabs), or 1 (convert tabs to spaces).
" cols = string with number of columns per tab, or empty to use 'tabstop'.
" The cursor position is restored, but the cursor will be in a different
" column when the number of characters in the indent of the line is changed.
function! IndentConvert(line1, line2, what, cols)
  let savepos = getpos('.')
  let cols = empty(a:cols) ? &tabstop : a:cols
  execute a:line1 . ',' . a:line2 . 's/^\s\+/\=Indenting(submatch(0), a:what, cols)/e'
  call histdel('search', -1)
  call setpos('.', savepos)
endfunction
command! -nargs=? -range=% Space2Tab call IndentConvert(<line1>,<line2>,0,<q-args>)
command! -nargs=? -range=% Tab2Space call IndentConvert(<line1>,<line2>,1,<q-args>)
command! -nargs=? -range=% RetabIndent call IndentConvert(<line1>,<line2>,&et,<q-args>)
