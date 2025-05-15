-- call nvim settings
require("config.settings")

-- call lazy (plugin manager)
require("config.lazy")

-- call custom keybinds for plugins
require("config.keybinds")

vim.lsp.enable('clangd')

-- call colourscheme
vim.g.moonflyTransparent = true
vim.cmd [[colorscheme moonfly]]
