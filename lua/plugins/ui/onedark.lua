return {
	"navarasu/onedark.nvim",
	priority = 1000,
	lazy = true, -- Don't load automatically, let user choose via theme picker
	config = function()
		require("onedark").setup({
			style = "darker", -- 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'
			transparent = true, -- Match catppuccin's transparency setting
			term_colors = true,
			ending_tildes = false,
			cmp_itemkind_reverse = false,

			-- Toggle theme style
			toggle_style_key = nil,
			toggle_style_list = { "dark", "darker", "cool", "deep", "warm", "warmer", "light" },

			-- Code style
			code_style = {
				comments = "italic",
				keywords = "none",
				functions = "none",
				strings = "none",
				variables = "none",
			},

			-- Lualine options
			lualine = {
				transparent = true,
			},

			-- Plugins Config
			diagnostics = {
				darker = true,
				undercurl = true,
				background = true,
			},
		})
	end,
}
