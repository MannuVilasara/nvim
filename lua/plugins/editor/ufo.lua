return {
	"kevinhwang91/nvim-ufo",
	dependencies = {
		"kevinhwang91/promise-async",
	},
	event = "VeryLazy",
	opts = {
		provider_selector = function(bufnr, filetype, buftype)
			return { "treesitter", "indent" }
		end,
	},
	config = function(_, opts)
		-- Fold settings
		vim.o.foldcolumn = "1" -- Set to "1" to show fold indicators
		vim.o.foldlevel = 99 -- Using ufo provider need a large value
		vim.o.foldlevelstart = 99
		vim.o.foldenable = true

		-- Setup UFO
		local ufo = require("ufo")
		ufo.setup(opts)

		-- LSP capabilities for folding
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities.textDocument.foldingRange = {
			dynamicRegistration = false,
			lineFoldingOnly = true,
		}

		-- Make capabilities available globally for LSP config
		vim.g.ufo_lsp_capabilities = capabilities

		-- Keymaps for folding
		vim.keymap.set("n", "zR", ufo.openAllFolds, { desc = "Open all folds" })
		vim.keymap.set("n", "zM", ufo.closeAllFolds, { desc = "Close all folds" })
		vim.keymap.set("n", "zr", ufo.openFoldsExceptKinds, { desc = "Open folds except kinds" })
		vim.keymap.set("n", "zm", ufo.closeFoldsWith, { desc = "Close folds with" })

		-- Peek fold with K
		vim.keymap.set("n", "K", function()
			local winid = ufo.peekFoldedLinesUnderCursor()
			if not winid then
				-- Choose one of coc.nvim and nvim-lsp
				vim.lsp.buf.hover()
			end
		end, { desc = "Peek fold or hover" })

		-- Additional fold navigation
		vim.keymap.set("n", "zk", function()
			ufo.goPreviousClosedFold()
		end, { desc = "Go to previous closed fold" })

		vim.keymap.set("n", "zj", function()
			ufo.goNextClosedFold()
		end, { desc = "Go to next closed fold" })
	end,
}
