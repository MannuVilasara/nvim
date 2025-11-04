return {
	"stevearc/oil.nvim",
	enabled = false,
	dependencies = {
		{ "echasnovski/mini.icons", lazy = false },
		{ "nvim-tree/nvim-web-devicons" },
	},
	config = function()
		local oil = require("oil")
		oil.setup()
		vim.keymap.set("n", "-", oil.toggle_float, { desc = "Open Oil file browser" })
	end,
	lazy = false,
}
