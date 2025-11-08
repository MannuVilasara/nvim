return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	version = "*",
	opts = {
		options = {
			mode = "buffers", -- Changed from "tabs" to "buffers" for better buffer management
			separator_style = "slant",
			always_show_bufferline = true,
			show_buffer_close_icons = true,
			show_close_icon = true,
			diagnostics = "nvim_lsp",
			offsets = {
				{
					filetype = "NvimTree",
					text = "File Explorer",
					text_align = "center",
					separator = true,
				},
			},
		},
	},
	keys = {
		-- Navigate between buffers
		{ "<Tab>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
		{ "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", desc = "Previous Buffer" },

		-- Move buffers
		{ "<leader>bn", "<cmd>BufferLineMoveNext<cr>", desc = "Move Buffer Right" },
		{ "<leader>bp", "<cmd>BufferLineMovePrev<cr>", desc = "Move Buffer Left" },

		-- Pick buffer
		{ "<leader>bb", "<cmd>BufferLinePick<cr>", desc = "Pick Buffer" },

		-- Close buffers
		{ "<leader>bd", "<cmd>bdelete<cr>", desc = "Delete Buffer" },
		{ "<leader>bc", "<cmd>BufferLinePickClose<cr>", desc = "Pick Close Buffer" },
		{ "<leader>bD", "<cmd>BufferLineCloseOthers<cr>", desc = "Delete Other Buffers" },

		-- Go to specific buffer
		{ "<leader>b1", "<cmd>BufferLineGoToBuffer 1<cr>", desc = "Go to Buffer 1" },
		{ "<leader>b2", "<cmd>BufferLineGoToBuffer 2<cr>", desc = "Go to Buffer 2" },
		{ "<leader>b3", "<cmd>BufferLineGoToBuffer 3<cr>", desc = "Go to Buffer 3" },
		{ "<leader>b4", "<cmd>BufferLineGoToBuffer 4<cr>", desc = "Go to Buffer 4" },
		{ "<leader>b5", "<cmd>BufferLineGoToBuffer 5<cr>", desc = "Go to Buffer 5" },
		{ "<leader>b6", "<cmd>BufferLineGoToBuffer 6<cr>", desc = "Go to Buffer 6" },
		{ "<leader>b7", "<cmd>BufferLineGoToBuffer 7<cr>", desc = "Go to Buffer 7" },
		{ "<leader>b8", "<cmd>BufferLineGoToBuffer 8<cr>", desc = "Go to Buffer 8" },
		{ "<leader>b9", "<cmd>BufferLineGoToBuffer 9<cr>", desc = "Go to Buffer 9" },
	},
}
