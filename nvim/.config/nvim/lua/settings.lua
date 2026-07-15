-- leader key
vim.g.mapleader = " "

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- indent
vim.opt.autoindent = true

-- tabs vs spaces lol
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

-- char representation
vim.opt.list = false

-- wrapping
vim.opt.shiftround = true
vim.opt.wrap = true
vim.opt.signcolumn = 'no'
vim.opt.winborder = 'rounded'

-- cmdline
vim.opt.pumborder = 'rounded'
vim.o.pumheight = 12
vim.opt.showmode = false

-- numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.ruler = true

-- fold settings
vim.o.foldcolumn = '1'
vim.wo.foldtext = ''
vim.o.foldlevelstart = 99

-- search
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true

-- errors
vim.opt.visualbell = false

-- autocorrect
vim.opt.spelllang = 'en_au'
vim.opt.spell = false
