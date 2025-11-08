return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
	end,
	config = function()
		local wk = require("which-key")
		wk.setup({
			preset = "modern",
			delay = 500,
		})

		-- Register group names for which-key
		wk.add({
			-- Main leader groups
			{ "<leader>c", group = "Code" },
			{ "<leader>e", group = "Explorer" },
			{ "<leader>f", group = "Find" },
			{ "<leader>g", group = "Git" },
			{ "<leader>i", group = "Insert" },
			{ "<leader>l", group = "Lazygit" },
			{ "<leader>m", group = "Music" },
			{ "<leader>s", group = "Split/Scratch" },
			{ "<leader>t", group = "Tab/Test/Terminal" },

			-- Specific keybindings documentation
			{ "<leader>1", desc = "Toggle terminal" },
			{ "<leader>h", desc = "Clear search highlights" },
			{ "<leader>S", desc = "Select scratch buffer" },
			{ "<leader><leader>", desc = "Recent files" },
			{ ":", desc = "Command palette" },
			{ "-", desc = "Oil file browser" },
			{ "K", desc = "LSP hover" },
			{ "gd", desc = "Go to definition" },
			{ "gr", desc = "Go to references" },
			{ "<C-p>", desc = "Find files" },
			{ "<C-n>", desc = "Snacks explorer" },
			{ "<C-\\>", desc = "Toggle terminal" },

			-- Code group
			{ "<leader>ca", desc = "Code action" },
			{ "<leader>cf", desc = "Format file/range" },
			{ "<leader>cr", desc = "Rename symbol" },

			-- Explorer group
			{ "<leader>ee", desc = "Toggle file explorer" },
			{ "<leader>ef", desc = "Find file in explorer" },
			{ "<leader>ec", desc = "Collapse file explorer" },
			{ "<leader>er", desc = "Refresh file explorer" },

			-- Find group
			{ "<leader>fb", desc = "Find buffers" },
			{ "<leader>fg", desc = "Grep files" },

			-- Git group
			{ "<leader>gl", desc = "Git log (current file)" },

			-- Insert group
			{ "<leader>in", desc = "Insert icon (Nerdy)" },

			-- Lazygit group
			{ "<leader>ld", desc = "Lazydocker" },
			{ "<leader>lg", desc = "Lazygit" },

			-- Music group
			{ "<leader>mp", desc = "Toggle Music Window" },
			-- { "<leader>ms", desc = "Markdown stop preview" },
			-- { "<leader>mt", desc = "Markdown toggle preview" },

			-- Scratch group
			{ "<leader>sf", desc = "Scratch buffer" },

			-- Split group
			{ "<leader>sv", desc = "Split vertically" },
			{ "<leader>sh", desc = "Split horizontally" },
			{ "<leader>se", desc = "Split equal size" },
			{ "<leader>sx", desc = "Close split" },

			-- Tab group
			{ "<leader>to", desc = "Open new tab" },
			{ "<leader>tx", desc = "Close tab" },
			{ "<leader>tn", desc = "Next tab" },
			{ "<leader>tp", desc = "Previous tab" },
			{ "<leader>tf", desc = "Open buffer in new tab" },

			-- Test group
			{ "<leader>tt", desc = "Test nearest" },
			{ "<leader>tF", desc = "Test file" },
			{ "<leader>ta", desc = "Test suite" },
			{ "<leader>tl", desc = "Test last" },
			{ "<leader>tv", desc = "Test visit" },
		})
	end,
}
