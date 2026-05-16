return {
	{
		"nvim-treesitter/nvim-treesitter",
                lazy = false,
                build = ":TSUpdate",
                config = function()
                        require("nvim-treesitter").setup()
                        require("nvim-treesitter").install({
                                        "bash",
                                        "ruby",
                                        "html",
                                        "css",
                                        "scss",
                                        "javascript",
                                        "typescript",
                                        "tsx",
                                        "lua",
                                        "markdown",
                                        "markdown_inline",
                                        "yaml",
                                        "dockerfile",
                                        "gitignore",
                                        "go",
                                        "qmljs",
                                        "qmldir",
                        })

                        vim.api.nvim_create_autocmd("FileType", {
                                callback = function()
                                        pcall(vim.treesitter.start)
                                end,
                        })
                end,
        },
}
