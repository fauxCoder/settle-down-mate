" Install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'junegunn/goyo.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'dag/vim-fish'
Plug 'urbit/hoon.vim'
Plug 'mileszs/ack.vim'
Plug 'morhetz/gruvbox'

call plug#end()

colorscheme gruvbox
set background=dark

" disable vi compatibility
set nocompatible

" use lightline and don't show mode twice
set laststatus=2
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

let g:lightline.active = { 'right': [['lineinfo'], ['fileformat', 'fileencoding', 'filetype']] }
let g:lightline.inactive = { 'right': [['lineinfo'], ['fileformat', 'fileencoding', 'filetype']] }

" search folders recursively
set path+=**
set wildignore+=**/build/**
set wildmenu

" silver searcher via ack
let g:ackprg = 'ag --vimgrep --ignore-dir build'

" trailing space intentional
nnoremap ,f :find 
nnoremap ,g :Ack 

set tabstop=4
set shiftwidth=4
set expandtab

set splitbelow
set splitright

set showcmd

" Scrolling
set scrolloff=5

" locale?
set encoding=utf8
set fileencoding=utf-8

" clipboard shared between windows
set clipboard=unnamed

if &diff
    syntax off
    highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
    highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
    highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
    highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red
endif

" stop having to press SHIFT
nnoremap ; :

" I never use ex mode
nnoremap Q <Nop>

command! MakeTags !ctags --recurse .
