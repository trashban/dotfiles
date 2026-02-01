" leader
let mapleader = " "

" remove vi compatibility
set nocompatible

" colours
syntax on
colorscheme lunaperche
set background=dark
set termguicolors

" numberline
set number
set relativenumber

" statusline
set ruler

" tab 
set wrap
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" search
set hlsearch
set wildmenu
set incsearch

" show invalid chars
set list
set listchars=tab:>-,trail:·,extends:#,nbsp:.   " highlight trailing whitespace

" improved history
set history=100
set undolevels=100

" indentation
filetype plugin indent on
set autoindent
set copyindent

" misc
set backspace=indent,eol,start  " intuitive backspace behavior
set vb t_vb=                    " remove that stupid flash

" lsp setup
packadd lsp

call LspAddServer([#{
\  name: 'clangd',
\  filetype: ['c', 'cpp'],
\  path: '/usr/bin/clangd',
\  args: ['--background-index']
\}])

call LspAddServer([#{name: 'rustanalyzer',
\  filetype: ['rust'],
\  path: '/home/ashin14/.cargo/bin/rust-analyzer',
\  args: [],
\  syncInit: v:true
\}])

""" custom keybinds
nnoremap <leader>o  :bro ol<CR>
nnoremap <leader>f  :Ex<CR>
nnoremap <leader>b  :ls<CR>:b

" lsp
nnoremap <S-k>      :LspHover<CR>
nnoremap <leader>d  :LspDiag current<CR>
nnoremap ga         :LspCodeAction<CR>
nnoremap gq         :LspFormat<CR>
nnoremap gi         :LspGotoImpl<CR>
nnoremap grr        :LspShowReferences<CR>
nnoremap grn        :LspRename<CR>
