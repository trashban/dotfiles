local arrows = require('icons').arrows
local lsp_sym = require('icons').diagnostics

-- leader key
vim.g.mapleader = " "

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- indent
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.tabstop = 4

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
