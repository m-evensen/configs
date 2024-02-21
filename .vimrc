" ================
" General Settings
" ================
syntax on		" Enable syntax highlighting
set number		" Show line numbers
set relativenumber	" Show relative line numbers
set belloff=all		" Silence <3
set nowrap		" Disable line wrap
set incsearch		" Incremental search
set hlsearch		" Highlight search results
set ignorecase		" Search case-insensitive
set smartcase		" Search case sensitive if any upper case letters
set hidden		" Possibility to have more than one unsaved buffer
set wildmenu|		" Command-line completion, use `<Tab>` to move around and `<cr>` to validate
set splitright		" Put new vertical splits on the right
set splitbelow		" Put new horizontal splits below
set scrolloff=10	" Show a few lines of context around the cursor
set laststatus=2	" Always show status line
set tags=tags;/		" Look for tags file in ancestor directory
set cursorline		" Highlight current line
set mouse=a		" Enable mouse support
set backspace=indent,eol,start		" Intuitive backspace behavior
set statusline=%f\ %h%m%r%=%y\ [%l,%c]	" Custom status line
filetype plugin indent on		" Enable filetype plugins, indenting, highlighting, omni-completion, etc.

"consider tab and indentation settings:
"set tabstop=4		" Number of spaces tabs count for
"set softtabstop=4	" See tabs as 4 spaces
"set expandtab		" Converts tabs to spaces
"set shiftwidth=4	" Number of spaces to use for each step of (auto)indent
"set smartindent	" Makes indenting smart

" ============
" Key Mappings
" ============

" General mappings
" ----------------
inoremap jk <esc>|	" Remap escape key
let mapleader=" "|	" Remap leader key"

" Remove search highlight
nnoremap <silent><leader><space> :nohlsearch<cr>	

" Source vim config and install plugins
nnoremap <silent><leader>1 :source ~/.vimrc \| :PlugInstall<cr>

" Easily switch between window splits
nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l

" FZF mappings
" ------------
map <leader>f <cmd>GFiles<cr>|	" find Git files in the working directory
map <leader>F <cmd>Files<cr>|	" find files in the working directory
map <leader>b <cmd>Buffers<cr>|	" find an open buffer
map <leader>t <cmd>BTags<cr>|	" find tags in current buffer (requires ctags)
map <leader>r :Rg|		" find text in working directory (requires ripgrep):
vnoremap <leader>r "ry:<c-u>Rg <c-r>r<cr>|	" find selected text (requires ripgrep):
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

" ===================
" Plugin Management
" (requires plug-vim)
" ===================
call plug#begin()
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fuzzy file finder
  Plug 'junegunn/fzf.vim' 		" Also necessary for fzf in vim
  Plug 'gruvbox-community/gruvbox'	" Gruvbox color schemes
  Plug 'tpope/vim-fugitive'		" Git integration
  Plug 'mg979/vim-visual-multi', {'branch': 'master'}	" Multiple cursors
  Plug 'neoclide/coc.nvim', {'branch': 'release'}	" Conqueror of Completion
call plug#end()

" Plugin settings
" ---------------
let g:netrw_banner=0	" Disable annoying banner
let g:netrw_liststyle=3	" Enable tree view
set encoding=utf-8	" coc.nvim calculates byte offset by count utf-8 byte sequence

" =====
" Theme
" =====
set bg=dark		" Set dark background
colorscheme gruvbox 	" Set color scheme to gruvbox, (requires gruvbox plugin)
