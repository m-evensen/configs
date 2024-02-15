" Basic Settings
syntax on		" Enable syntax highlighting
set number		" Show line numbers
set relativenumber	" Show relative line numbers
set belloff=all		" Silence <3
set nowrap		" Disable line wrap
set incsearch		" Incremental search
set hlsearch		" Highlight search results
set hidden		" Possibility to have more than one unsaved buffer
set wildmenu		" Command-line completion, use `<Tab>` to move around and `<cr>` to validate
set splitright		" Put new vertical splits on the right
set splitbelow		" Put new horizontal splits below
set scrolloff=10	" Show a few lines of context around the cursor
set laststatus=2	" Always show status line
set cursorline		" Highlight current line
set backspace=indent,eol,start		" Intuitive backspace behavior
set statusline=%f\ %h%m%r%=%y\ [%l,%c]	" Custom status line
filetype plugin indent on		" Enable filetype plugins, indenting, highlighting, omni-completion, etc.

" Key Mappings
inoremap jk <esc>	" remap escape key
let mapleader=" "	" remap leader key
nnoremap <leader><space> :nohlsearch<cr>			" Remove search highlight
nnoremap <silent><leader>1 :source ~/.vimrc \| :PlugInstall<cr>	" Source vim config and install plugins
" remap window switch {
nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l
" }
" fzf mappings {
map <leader>f <cmd>GFiles<cr>|	" fuzzy find Git files in the working directory
map <leader>F <cmd>Files<cr>|	" fuzzy find files in the working directory
map <leader>b <cmd>Buffers<cr>|	" fuzzy find an open buffer
"map <leader>l <cmd>Files %:h<cr>
"map <leader>t <cmd>BTags<cr>
map <leader>r :Rg | 		" fuzzy find text in the working directory
vnoremap <leader>r "ry:<c-u>Rg <c-r>r<cr>|	" fuzzy find selected text
" }
"nnoremap <C-j> :cnext<cr>     " Ctrl+j to go to next item in quickfix list
"nnoremap <C-k> :cprev<cr>     " Ctrl+k to go to previous item in quickfix list
"nnoremap <leader>o :setlocal spell! spelllang=en_us<cr> " Toggle spell check

" Plugins (vim-plug)
call plug#begin()
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fuzzy file finder
  Plug 'junegunn/fzf.vim' 		" Also necessary for fzf in vim
  Plug 'gruvbox-community/gruvbox'	" Gruvbox color schemes
  Plug 'tpope/vim-fugitive'		" Git integration
call plug#end()

" Color Scheme
set bg=dark		" Set dark background
colorscheme gruvbox 	" Set color scheme to gruvbox, after plugin installation

" netrw settings
let g:netrw_banner=0	" Disable annoying banner
let g:netrw_liststyle=3	" Enable tree view
