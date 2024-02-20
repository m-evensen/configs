" Basic Settings
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
"consider tab and indentation settings:
"set tabstop=4		" Number of spaces tabs count for
"set softtabstop=4	" See tabs as 4 spaces
"set expandtab		" Converts tabs to spaces
"set shiftwidth=4	" Number of spaces to use for each step of (auto)indent
"set smartindent	" Makes indenting smart
set encoding=utf-8	" coc.nvim calculates byte offset by count utf-8 byte sequence

set backspace=indent,eol,start		" Intuitive backspace behavior
set statusline=%f\ %h%m%r%=%y\ [%l,%c]	" Custom status line
filetype plugin indent on		" Enable filetype plugins, indenting, highlighting, omni-completion, etc.

" Key Mappings
inoremap jk <esc>|	" remap escape key
let mapleader=" "|	" remap leader key
nnoremap <leader><space> :nohlsearch<cr>|			" Remove search highlight
nnoremap <silent><leader>1 :source ~/.vimrc \| :PlugInstall<cr>|" Source vim config and install plugins
"
" remap window switch {
nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l
" }
"
" fzf mappings {
map <leader>f <cmd>GFiles<cr>|	" fuzzy find Git files in the working directory
map <leader>F <cmd>Files<cr>|	" fuzzy find files in the working directory
map <leader>b <cmd>Buffers<cr>|	" fuzzy find an open buffer
"map <leader>l <cmd>Files %:h<cr>
map <leader>t <cmd>BTags<cr>|	" fuzzy find tags in current buffer (requires ctags)
" fuzzy find text in working directory (requires ripgrep):
map <leader>r :Rg 		
" fuzzy find selected text (requires ripgrep):
vnoremap <leader>r "ry:<c-u>Rg <c-r>r<cr>
" }
"
" coc mappings {
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
" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" }

" Plugins (vim-plug)
call plug#begin()
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fuzzy file finder
  Plug 'junegunn/fzf.vim' 		" Also necessary for fzf in vim
  Plug 'gruvbox-community/gruvbox'	" Gruvbox color schemes
  Plug 'tpope/vim-fugitive'		" Git integration
  Plug 'mg979/vim-visual-multi', {'branch': 'master'}	" Multiple cursors
  Plug 'neoclide/coc.nvim', {'branch': 'release'}	" Conqueror of Completion
call plug#end()

" Color Scheme
set bg=dark		" Set dark background
colorscheme gruvbox 	" Set color scheme to gruvbox, after plugin installation

" netrw settings
let g:netrw_banner=0	" Disable annoying banner
let g:netrw_liststyle=3	" Enable tree view
