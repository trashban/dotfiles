vim.pack.add({"https://github.com/stevearc/conform.nvim"})

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
		python = { "ruff", stop_after_first = true },
	},
})
