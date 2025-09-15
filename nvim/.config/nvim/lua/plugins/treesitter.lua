vim.pack.add({"https://github.com/nvim-treesitter/nvim-treesitter"})

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
