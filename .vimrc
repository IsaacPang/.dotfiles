" Vim plug block
call plug#begin('~/.vim/plugged')

Plug 'simonsmith/material.vim'

Plug 'junegunn/vim-easy-align'

Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

Plug 'mcchrish/nnn.vim'

Plug 'jlanzarotta/bufexplorer'

Plug 'sheerun/vim-polyglot'

Plug 'tpope/vim-repeat'

Plug 'tomtom/tcomment_vim'

Plug 'matze/vim-move'

Plug 'terryma/vim-multiple-cursors'

Plug 'chaoren/vim-wordmotion'

Plug 'psliwka/vim-smoothie'

" Improve pasting code from clipboard
Plug 'ConradIrwin/vim-bracketed-paste'

Plug 'vim-airline/vim-airline'

Plug 'gcmt/taboo.vim'

Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

" Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

call plug#end()

set background=dark
silent! colorscheme material

let mapleader=' '
let maplocalleader='\'

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

set softtabstop=4
set tabstop=4
set shiftwidth=4

set expandtab

set noshowmode

set splitbelow
set splitright

set ignorecase
set smartcase

" Need to check if vim comes with clipboard support
" vim --version shows it up
" look for +clipboard and +xterm_clipboard
" otherwise, install vim-gtk or vim-gnome (Ubuntu/Debian) or vim-X11 (Debian)
set clipboard=unnamedplus

set ttimeoutlen=0

set title

set showcmd

set number
set relativenumber

set scrolloff=10

" Key mappings
" --------------------------------------------

nnoremap k gk
nnoremap j gj
vnoremap k gk
vnoremap j gj

nnoremap Y y$

" Switch buffers
nnoremap <silent>H :silent bp<CR>
nnoremap <silent>L :silent bn<CR>

" Clear search
nnoremap <silent> <leader>k :noh<cr>

vnoremap < <gv
vnoremap > >gv

inoremap kj <esc>
cnoremap kj <C-C>

" Switch between splits
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-k> <C-w>k
nnoremap <C-j> <C-w>j

" Markdown Preview Settings
" --------------------------------------------
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 1

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" default: ''
let g:mkdp_browser = ''

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {}
    \ }

" use a custom markdown style must be absolute path
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
let g:mkdp_highlight_css = ''

" use a custom port to start server or random for empty
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'