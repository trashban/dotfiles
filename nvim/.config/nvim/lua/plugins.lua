vim.pack.add({
	-- colorscheme
	{ src = "https://github.com/folke/tokyonight.nvim" },

	-- mini utils
	{ src = "https://github.com/nvim-mini/mini.pick" },
	{ src = "https://github.com/nvim-mini/mini.surround" },
	{ src = "https://github.com/nvim-mini/mini.icons" },
	{ src = "https://github.com/nvim-mini/mini.pairs" },
	{ src = "https://github.com/nvim-mini/mini.extra" },

	-- lsp/formatting
	{ src = "https://github.com/rafamadriz/friendly-snippets" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/saghen/blink.cmp" },
	{ src = "https://github.com/stevearc/conform.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/lukas-reineke/indent-blankline.nvim" },

	-- ui
	{ src = "https://github.com/j-hui/fidget.nvim" },
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
	{ src = "https://github.com/rebelot/heirline.nvim" },
	{ src = "https://github.com/Zeioth/heirline-components.nvim" },
	{ src = "https://github.com/rachartier/tiny-inline-diagnostic.nvim" },

	-- workflow
	{ src = "https://github.com/otavioschwanck/arrow.nvim" },
	{ src = "https://github.com/stevearc/oil.nvim" },
})

-- setup calls (there probably is a cleaner solution...)

require("mini.surround").setup()
require("mini.extra").setup()
require("mini.pick").setup()
require("mini.icons").setup()
require("mini.pairs").setup()

require("arrow").setup({
	show_icons = true,
	leader_key = ";", -- Recommended to be a single key
	buffer_leader_key = "m", -- Per Buffer Mappings
})
require("oil").setup()
require("ibl").setup()
require("blink.cmp").setup({
	keymap = { preset = "default" },
	completion = { documentation = { auto_show = false } },
	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
	},
	fuzzy = { implementation = "lua" },
})
require("conform").setup({
	formatters_by_ft = {
		fish = { "fish_indent" },
		sh = { "shfmt" },
		lua = { "stylua" },
		javascript = { "prettierd", "prettier", stop_after_first = true },
		typescript = { "prettierd", "prettier", stop_after_first = true },
		typescriptreact = { "prettierd", "prettier", stop_after_first = true },
		c = { "clang-format" },
		cpp = { "clang-format" },
		go = { "gopls" },
		rust = { "rustfmt" },
	},
})

require("gitsigns").setup({
	current_line_blame = true,
})
require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"rust",
		"c",
		"lua",
		"python",
		"javascript",
		"typescript",
		"html",
		"css",
		"svelte",
		"toml",
		"json",
		"yaml",
		"markdown",
		"gitignore",
	},
	auto_install = true,
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	},
})
require("tokyonight").setup({
	-- use the night style
	style = "night",
	-- disable italic for functions
	styles = {
		functions = {},
	},
	-- Change the "hint" color to the "orange" color, and make the "error" color bright red
	on_colors = function(colors)
		colors.bg = "#000000"
	end,
})
