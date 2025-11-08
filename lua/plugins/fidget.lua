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

		-- Progress spinner demo
		vim.keymap.set("n", "<leader>np", function()
			local progress = require("fidget.progress")

			-- Create a progress handle
			local handle = progress.handle.create({
				title = "Loading",
				message = "Please wait...",
				lsp_client = { name = "demo" },
			})

			-- Simulate progress updates
			local percent = 0
			local timer = vim.loop.new_timer()
			timer:start(
				0,
				100,
				vim.schedule_wrap(function()
					percent = percent + 5
					if percent <= 100 then
						handle:report({
							message = string.format("Processing... %d%%", percent),
							percentage = percent,
						})
					else
						handle:finish()
						timer:stop()
						timer:close()
						fidget.notify("Loading complete!", vim.log.levels.INFO)
					end
				end)
			)
		end, { desc = "Fidget Demo: Progress spinner" })
	end,
}
