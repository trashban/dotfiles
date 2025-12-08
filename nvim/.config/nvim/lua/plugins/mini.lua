vim.pack.add({"https://github.com/nvim-mini/mini.nvim"})

require("mini.surround").setup()
require("mini.extra").setup()
require("mini.pick").setup()
require("mini.pairs").setup()
require("mini.comment").setup()
require("mini.files").setup()
require('mini.cmdline').setup()

require("mini.icons").setup()
MiniIcons.mock_nvim_web_devicons()
