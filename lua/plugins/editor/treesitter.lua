return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "master",
		build = ":TSUpdate",
		config = function()
			local config = require("nvim-treesitter.configs")
			config.setup({
				ignore_install = { "haskell" },
				sync_install = false,
				modules = {},
				auto_install = false,
				ensure_installed = {
					"bash",
					"ruby",
					"html",
					"css",
					"scss",
					"javascript",
					"typescript",
					"tsx",
					"json",
					"jsonc",
					"lua",
					"markdown",
					"markdown_inline",
					"yaml",
					"dockerfile",
					"gitignore",
					"go",
					"qmljs",
					"qmldir",
				},
				highlight = { enable = true },
				indent = { enable = false },
			})
		end,
	},
}
