return {
	"hachy/cmdpalette.nvim",
	config = function()
		require("cmdpalette").setup({
			win = {
				height = 0.3,
				width = 0.8,
				border = "rounded",
				row_off = -2,
				title = "Command Palette",
				title_pos = "center",
			},
			start_insert = true,
		})

		-- Set up keybinding to open cmdpalette
		-- Option 1: Replace the default : with cmdpalette
		vim.keymap.set("n", ":", "<Plug>(cmdpalette)", { desc = "Open command palette" })
		
		-- Option 2: Use a leader key (uncomment if you prefer this)
		-- vim.keymap.set("n", "<leader>:", "<Plug>(cmdpalette)", { desc = "Open command palette" })
		
		-- Option 3: Use <C-p> for command palette (uncomment if you prefer this)
		-- vim.keymap.set("n", "<leader>cp", "<Plug>(cmdpalette)", { desc = "Open command palette" })
	end,
}
