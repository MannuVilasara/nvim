return {
	"Mofiqul/dracula.nvim",
	lazy = true, -- do not load at startup; let Snacks picker/load commands enable it
	config = function()
		require("dracula").setup({
			transparent_bg = true, -- match your transparent theme setup
			show_end_of_buffer = false,
			colors = {},
			italics = {
				comments = true,
				functions = false,
				keywords = false,
				strings = false,
				variables = false,
			},
		})
	end,
}
