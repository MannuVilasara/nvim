return {
	"j-hui/fidget.nvim",
	opts = {
		progress = {
			display = {
				done_icon = "✔",
			},
		},
		notification = {
			override_vim_notify = true,
		},
	},
	config = function(_, opts)
		local fidget = require("fidget")
		fidget.setup(opts)

		-- Demo notification keymaps
		vim.keymap.set("n", "<leader>na", function()
			fidget.notify("This is from fidget.notify().")
		end, { desc = "Fidget Demo: Info notification" })

		vim.keymap.set("n", "<leader>nb", function()
			fidget.notify("This is also from fidget.notify().", vim.log.levels.WARN)
		end, { desc = "Fidget Demo: Warning notification" })

		vim.keymap.set("n", "<leader>nc", function()
			fidget.notify(
				"fidget.notify() supports annotations...",
				nil,
				{ annote = "I use Arch Btw 󰣇", key = "foobar" }
			)
		end, { desc = "Fidget Demo: Notification with annotation" })
	end,
}
