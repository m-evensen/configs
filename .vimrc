" ================
" General Settings
" ================
syntax on           " Enable syntax highlighting
set number          " Show line numbers
set relativenumber  " Show relative line numbers
set belloff=all     " Silence <3
set nowrap          " Disable line wrap
set incsearch       " Incremental search
set hlsearch        " Highlight search results
set ignorecase      " Search case-insensitive
set smartcase       " Search case sensitive if any upper case letters
set hidden          " Allow more than one unsaved buffer
set wildmenu        " Command-line completion, use `<Tab>` to move around and `<CR>` to validate
set splitright      " Put new vertical splits on the right
set splitbelow      " Put new horizontal splits below
set scrolloff=10    " Show a few lines of context around the cursor
set tags=tags;/     " Look for tags file in ancestor directory
set cursorline      " Highlight current line
set mouse=a         " Enable mouse support
set expandtab       " Insert spaces instead of tabs
set tabstop=4       " Display tabs with the width of 4 spaces
set softtabstop=4   " Insert 4 spaces when pressing `<Tab>`
set shiftwidth=4    " Number of spaces to use for each step of (auto)indent
set undofile        " Enable undo files
set undodir=~/.vim/tmp//    " Undo files to common location
set dir=~/.vim/tmp//        " Swap files to common location 
set backspace=indent,eol,start          " Intuitive backspace behavior
filetype plugin indent on               " Enable filetype plugins, indenting, highlighting, omni-completion, etc.

" ============
" Key Mappings
" ============

" General mappings
" ----------------
" Remap escape key
inoremap jk <esc>

" Remap leader key
let mapleader=" "

" Remove search highlight
nnoremap <silent><leader><space> :nohlsearch<cr>    

" Source vim config and install plugins
nnoremap <silent><leader>1 :source ~/.vimrc \| :PlugInstall<cr>

" Easily switch between window splits
nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l

" Toggle the file explorer (netrw)
nnoremap <Leader>e :Lex<CR>

" FZF mappings
" ------------
map <leader>f <cmd>GFiles<cr>|  " find Git files in the working directory
map <leader>F <cmd>Files<cr>|   " find files in the working directory
map <leader>b <cmd>Buffers<cr>| " find an open buffer
map <leader>t <cmd>BTags<cr>|   " find tags in current buffer (requires ctags)
map <leader>rg :Rg |            " find text in working directory (requires ripgrep):
vnoremap <leader>r "ry:<c-u>Rg <c-r>r<cr>|  " find selected text (requires ripgrep):
" consider: map <leader>l <cmd>Files %:h<cr> " find files in current folder

" CoC.nvim mappings
" -----------------
inoremap <silent><expr> <c-j>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<c-j>" :
      \ coc#refresh()
inoremap <expr><c-k> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>""
" Make <CR> to accept selected completion item or notify coc.nvim to format
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>""
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
nmap <leader>rn <Plug>(coc-rename)| " Symbol renaming
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" Format selected code (mnemonic: 'code format')
xmap <leader>cf <Plug>(coc-format-selected)
nmap <leader>cf <Plug>(coc-format-selected)
" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" ===================
" Plugin Management
" (requires plug-vim)
" ===================
call plug#begin()
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }   " Fuzzy file finder
  Plug 'junegunn/fzf.vim'                               " Also necessary for fzf in vim
  Plug 'tpope/vim-fugitive'                             " Git integration
  Plug 'mg979/vim-visual-multi', {'branch': 'master'}   " Multiple cursors
  Plug 'neoclide/coc.nvim', {'branch': 'release'}       " Conqueror of Completion
  Plug 'gruvbox-community/gruvbox'                      " Gruvbox color schemes
  Plug 'vim-airline/vim-airline'                        " Airline statusline
call plug#end()

" Plugin settings
" ---------------
let g:netrw_banner=0        " Disable annoying banner
let g:netrw_winsize=25      " Set the initial width of the netrw window
let g:netrw_liststyle=3     " Enable tree view
let g:netrw_browse_split=4  " Open file in window that was active before calling :Lex
set encoding=utf-8          " CoC.nvim calculates byte offset by count utf-8 byte sequence

" =====
" Theme
" =====
set bg=dark         " Set dark background
set termguicolors   " Gives Vim access to a broader range of colours
colorscheme gruvbox " Set color scheme to gruvbox (requires gruvbox plugin)
