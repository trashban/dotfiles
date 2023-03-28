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
Plug 'preservim/nerdtree'
Plug 'nvim-lualine/lualine.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'

" pluin themes
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'NLKNguyen/papercolor-theme'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'Alexis12119/nightly.nvim'

" end plugins
call plug#end()

" nerdtree keybinds + launch options
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') && v:this_session == '' | NERDTree | endif

lua << END
require('lualine').setup {}
require("indent_blankline").setup {}

END

" colourscheme
set background=dark
" colorscheme tokyonight-night
" colorscheme PaperColor
" colorscheme catppuccin-mocha
colorscheme nightly
