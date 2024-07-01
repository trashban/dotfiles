-- allow plugins to work
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- enable 24-bit colour
vim.opt.termguicolors = true

-- line numbers
vim.o.number = true
vim.wo.relativenumber = true

-- set <header> button
-- keybind for telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>tt', ':Neotree', {})
