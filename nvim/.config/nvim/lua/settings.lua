-- leader key
vim.g.mapleader = " "

-- i actually like netrw
vim.g.loaded_netrw = 0
vim.g.loaded_netrwPlugin = 0

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
vim.opt.winborder = 'single'

-- cmdline
vim.opt.pumborder = 'single'
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
vim.diagnostic.config({ virtual_text = true })

-- autocorrect
vim.opt.spelllang = 'en_au'
vim.opt.spell = false

-- autocomplete
vim.opt.completeopt:append("noselect")
