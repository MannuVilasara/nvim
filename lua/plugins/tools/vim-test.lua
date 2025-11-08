return {
	"vim-test/vim-test",
	dependencies = {
		"preservim/vimux",
	},
	config = function()
		vim.keymap.set("n", "<leader>tt", ":TestNearest<CR>", { desc = "Test nearest" })
		vim.keymap.set("n", "<leader>tF", ":TestFile<CR>", { desc = "Test file" })
		vim.keymap.set("n", "<leader>ta", ":TestSuite<CR>", { desc = "Test suite" })
		vim.keymap.set("n", "<leader>tl", ":TestLast<CR>", { desc = "Test last" })
		vim.keymap.set("n", "<leader>tv", ":TestVisit<CR>", { desc = "Test visit" })
		vim.cmd("let test#strategy = 'vimux'")
	end,
}
