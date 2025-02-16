-- call lazy (plugin manager)
require("config.lazy")

-- call nvim settings
require("config.settings")

-- use colourscheme
vim.cmd [[colorscheme moonfly]]

-- use statusline
require('mini.statusline').setup()
