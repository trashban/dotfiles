" remove vi compatibility
set nocompatible

" leader
let mapleader = " "

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
set path+=**
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
" filetype plugin indent on (vim-plug automatically does this)
set autoindent
set copyindent

" netrw tweaks
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view

" misc
set backspace=indent,eol,start  " intuitive backspace behavior
set vb t_vb=                    " remove that stupid flash

" keybinds
nnoremap <leader>o  :bro ol!<CR>
nnoremap <leader>f  :E!<CR>
nnoremap <leader>b  :ls!<CR>:b!

" lsp 
packadd lsp

call LspAddServer([#{
\  name: 'clangd',
\  filetype: ['c', 'cpp'],
\  path: '/usr/bin/clangd',
\  args: ['--background-index']
\}])

call LspAddServer([#{
\  name: 'golang',
\  filetype: ['go', 'gomod'],
\  path: '/usr/bin/gopls',
\  args: ['serve'],
\  syncInit: v:true
\}])

" Rust language server
call LspAddServer([#{
\  name: 'rustlang',
\  filetype: ['rust'],
\  path: '/home/ashin14/.cargo/bin/rust-analyzer',
\  args: [],
\  syncInit: v:true
\}])

nnoremap <S-k>      :LspHover<CR>
nnoremap <leader>d  :LspDiag current<CR>
nnoremap ga         :LspCodeAction<CR>
nnoremap gq         :LspFormat<CR>
nnoremap gi         :LspGotoImpl<CR>
nnoremap grr        :LspShowReferences<CR>
nnoremap grn        :LspRename<CR>
