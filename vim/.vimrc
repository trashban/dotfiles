" vim configuration
" trashban
"
" its designed so i minimise how much plugins i use because i want to
" learn/use more of vim's native commands/motions.
"
" some settings are additional/opinionated, but they stem from my habits from nvim
" and i probably can't live without them anymore, so they're here to stay.

" remove vi compatibility
set nocompatible

" leader
let mapleader = " "

" plugins
packadd lsp

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
filetype plugin indent on
set autoindent
set copyindent

" netrw tweaks
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view

" statusline
set statusline=
set statusline+=%7*\[%n]                                  "buffernr
set statusline+=%1*\ %<%F\                                "File+path
set statusline+=%2*\ %y\                                  "FileType
set statusline+=%3*\ %{''.(&fenc!=''?&fenc:&enc).''}      "Encoding
set statusline+=%3*\ %{(&bomb?\",BOM\":\"\")}\            "Encoding2
set statusline+=%4*\ %{&ff}\                              "FileFormat (dos/unix..)
set statusline+=%5*\ %{&spelllang}\%{HighlightSearch()}\  "Spellanguage & Highlight on?
set statusline+=%8*\ %=\ row:%l/%L\ (%03p%%)\             "Rownumber/total (%)
set statusline+=%9*\ col:%03c\                            "Colnr
set statusline+=%0*\ \ %m%r%w\ %P\ \                      "Modified? Readonly? Top/bot.

" misc
set backspace=indent,eol,start  " intuitive backspace behavior
set vb t_vb=                    " remove that stupid flash

" lsp server setup
call LspAddServer([#{
\  name: 'clangd',
\  filetype: ['c', 'cpp'],
\  path: '/usr/bin/clangd',
\  args: ['--background-index']
\}])

call LspAddServer([#{name: 'rust-analyzer',
\  filetype: ['rust'],
\  path: '/home/ashin14/.cargo/bin/rust-analyzer',
\  args: [],
\  syncInit: v:true
\}])

" custom keybinds
nnoremap <leader>o  :bro ol<CR>
nnoremap <leader>f  :E<CR>
nnoremap <leader>b  :ls<CR>:b

" lsp
nnoremap <S-k>      :LspHover<CR>
nnoremap <leader>d  :LspDiag current<CR>
nnoremap ga         :LspCodeAction<CR>
nnoremap gq         :LspFormat<CR>
nnoremap gi         :LspGotoImpl<CR>
nnoremap grr        :LspShowReferences<CR>
nnoremap grn        :LspRename<CR>
