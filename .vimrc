" remap escape key
inoremap jk <esc>

" remap leader key
let mapleader=" "

" remap window switching
nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l

" yank/paste from/to system clipboard
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>p "+p
vnoremap <leader>p "+p

" put new splits on the right/below
set splitright
set splitbelow

" silence <3
set belloff=all

" search as characters are entered; highlight matches
set incsearch
set hlsearch

" remove search highlight
nnoremap <leader><space> :nohlsearch<CR>

" show a few lines of context around the cursor
set scrolloff=8

" show relative line numbers
set relativenumber
set number

" status line
set laststatus=2
set statusline=%f\ %h%m%r%=%y\ [%l,%c]

" color scheme
colo desert
