require('settings')
require('binds')
require('plugins')
require('lsp')
require('statusline')

vim.cmd.colorscheme("tokyonight")

-- transparency
vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE", fg = "NONE" })
vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE", fg = "NONE" })
