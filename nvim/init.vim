" nvim config
" amby

" display number-lines 
set number

" highlight syntax
syntax on 

" highlight text when search function is used
set hls is 

" colour support
set t_Co=256

" general options
set mouse=a

call plug#begin()
" plugins
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-lualine/lualine.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
Plug 'romgrk/barbar.nvim'

" pluin themes
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'NLKNguyen/papercolor-theme'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'Alexis12119/nightly.nvim'

" icons
Plug 'nvim-tree/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'

" end plugins
call plug#end()

" keybinds
nnoremap <silent> <A-t> <Cmd>NvimTreeToggle<CR>
nnoremap <A-f> :Telescope find_files<CR> 
nnoremap <silent>    <A-p> <Cmd>BufferPin<CR>
nnoremap <silent>    <A-w> <Cmd>BufferClose<CR>
nnoremap <silent>    <A-r> <Cmd>BufferRestore<CR>
nnoremap <silent>    <A-1> <Cmd>BufferGoto 1<CR>
nnoremap <silent>    <A-2> <Cmd>BufferGoto 2<CR>
nnoremap <silent>    <A-3> <Cmd>BufferGoto 3<CR>
nnoremap <silent>    <A-4> <Cmd>BufferGoto 4<CR>
nnoremap <silent>    <A-5> <Cmd>BufferGoto 5<CR>
nnoremap <silent>    <A-6> <Cmd>BufferGoto 6<CR>
nnoremap <silent>    <A-7> <Cmd>BufferGoto 7<CR>
nnoremap <silent>    <A-8> <Cmd>BufferGoto 8<CR>
nnoremap <silent>    <A-9> <Cmd>BufferGoto 9<CR>
nnoremap <silent>    <A-0> <Cmd>BufferLast<CR>
nnoremap <silent>    <A-h> <Cmd>BufferMovePrevious<CR>
nnoremap <silent>    <A-l> <Cmd>BufferMoveNext<CR>

lua << END
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
require('lualine').setup {}
require("indent_blankline").setup {}
require'nvim-treesitter.configs'.setup {}
require("nvim-tree").setup {}
require'barbar'.setup {}
END

" colourscheme
set background=dark
" colorscheme tokyonight-night
" colorscheme PaperColor
" colorscheme catppuccin-mocha
colorscheme nightly
