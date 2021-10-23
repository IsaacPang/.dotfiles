" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
" Colour Scheme Plugins
Plug 'lifepillar/vim-gruvbox8'

" Airline Plugins
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Others
Plug 'tpope/vim-sensible'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'}
Plug 'simonsmith/material.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" Show line numbers
set relativenumber number

let mapleader=' '
let maplocalleader='\'

set nocompatible
filetype plugin on
syntax on

set noswapfile
set nobackup
set nowb

set binary

set termguicolors

set textwidth=100

set foldmethod=indent
set nofoldenable

set hidden

set cursorline

set noshowmode

set splitbelow
set splitright

set ignorecase
set smartcase

" fzf-vim options
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'Type'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Character'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

set softtabstop=4 tabstop=4 shiftwidth=4 expandtab

set clipboard=unnamed

" Key mappings
" -------------------------------------------------- 

nnoremap k gk
nnoremap j gj
vnoremap k gk
vnoremap j gj

nnoremap Y y$

" Switch buffers
nnoremap <silent>H :silent bp<CR>
nnoremap <silent>L :silent bn<CR>

" Clear search
vnoremap < <gv
vnoremap > >gv

" inoremap kj <esc>
" cnoremap kj <C-C>

" Switch between splits
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-k> <C-w>k
nnoremap <C-j> <C-w>j

" Switch between tabs
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>


" Remove highlighting when exiting search
nnoremap <esc> :noh<return><esc>

"{{ Colour Schemes

" Unified color scheme (default: dark)
" color seoul256
" silent! colorscheme material
let g:gruvbox_italics=1
let g:gruvbox_italicize_strings=1
let g:gruvbox_filetype_hi_groups=0
let g:gruvbox_plugin_hi_groups=0
colorscheme gruvbox8

"}}
