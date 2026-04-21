local arrows = require('icons').arrows
local lsp_sym = require('icons').diagnostics

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
vim.opt.expandtab = true
vim.opt.softtabstop = 4

-- char representation
vim.opt.list = true
vim.opt.listchars = {
    tab = "  ",
    trail = "·",
}

-- wrapping
vim.opt.shiftround = true
vim.opt.wrap = false
vim.opt.signcolumn = 'yes'
vim.opt.winborder = 'double'

-- cmdline
vim.opt.pumborder = 'double'
vim.o.pumheight = 12

-- numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.ruler = true

-- fold settings
vim.o.foldcolumn = '1'
vim.o.foldlevelstart = 99
vim.wo.foldtext = ''
vim.opt.fillchars = {
    fold = ' ', foldclose = arrows.right,
    foldopen = arrows.down,
    foldsep = ' ',
    foldinner = ' '
}

-- search
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true

-- errors
vim.opt.visualbell = false

-- autocorrect
vim.opt.spelllang = 'en_au'
vim.opt.spell = true

-- lsp symbols
vim.diagnostic.config({
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = lsp_sym.ERROR,
			[vim.diagnostic.severity.WARN] = lsp_sym.WARN,
			[vim.diagnostic.severity.INFO] = lsp_sym.INFO,
			[vim.diagnostic.severity.HINT] = lsp_sym.HINT,
		},
		linehl = {
			[vim.diagnostic.severity.ERROR] = "ErrorMsg",
		},
		numhl = {
			[vim.diagnostic.severity.WARN] = "WarningMsg",
		},
	},
})
