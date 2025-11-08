return {
	"iamcco/markdown-preview.nvim",
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	build = function()
		vim.fn["mkdp#util#install"]()
	end,
	init = function()
		vim.g.mkdp_filetypes = { "markdown" }
		-- Set browser to open preview in
		vim.g.mkdp_browser = ""
		-- Auto start preview when opening markdown file
		vim.g.mkdp_auto_start = 0
		-- Auto close preview when leaving markdown buffer
		vim.g.mkdp_auto_close = 1
		-- Refresh preview on save or leaving insert mode
		vim.g.mkdp_refresh_slow = 0
		-- Enable preview for all markdown files
		vim.g.mkdp_command_for_global = 0
		-- Preview server port
		vim.g.mkdp_port = "8080"
		-- Preview page title
		vim.g.mkdp_page_title = "${name}"
	end,
	ft = { "markdown" },
	config = function()
		-- Set up keymaps for markdown preview
		vim.keymap.set("n", "<leader>mp", "<cmd>MarkdownPreview<CR>", { desc = "Start markdown preview" })
		vim.keymap.set("n", "<leader>ms", "<cmd>MarkdownPreviewStop<CR>", { desc = "Stop markdown preview" })
		vim.keymap.set("n", "<leader>mt", "<cmd>MarkdownPreviewToggle<CR>", { desc = "Toggle markdown preview" })
	end,
}
