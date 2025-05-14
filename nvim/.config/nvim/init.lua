-- call nvim settings
require("config.settings")

-- call lazy (plugin manager)
require("config.lazy")

-- call custom keybinds for plugins
require("config.keybinds")

-- call colourscheme
vim.g.moonflyTransparent = true
vim.cmd [[colorscheme moonfly]]
