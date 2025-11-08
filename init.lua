local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Load core configuration
-- Try new structure first, fallback to old if not migrated yet
local core_config = vim.fn.filereadable(vim.fn.stdpath("config") .. "/lua/core/options.lua") == 1
	and "core.options"
	or "vim-options"
require(core_config)

-- Setup lazy.nvim with plugin directories
-- This will automatically load all plugins from:
-- - lua/plugins/*.lua (root level plugins if any remain)
-- - lua/plugins/ui/*.lua
-- - lua/plugins/editor/*.lua
-- - lua/plugins/lsp/*.lua
-- - lua/plugins/git/*.lua
-- - lua/plugins/tools/*.lua
require("lazy").setup({
	{ import = "plugins" },
	{ import = "plugins.ui" },
	{ import = "plugins.editor" },
	{ import = "plugins.lsp" },
	-- { import = "plugins.git" },
	{ import = "plugins.tools" },
}, {
	-- Lazy.nvim configuration
	checker = {
		enabled = true,
		notify = false,
	},
	change_detection = {
		notify = false,
	},
	ui = {
		border = "rounded",
		icons = {
			cmd = " ",
			config = "",
			event = " ",
			ft = " ",
			init = " ",
			import = " ",
			keys = " ",
			lazy = "󰒲 ",
			loaded = "●",
			not_loaded = "○",
			plugin = " ",
			runtime = " ",
			require = "󰢱 ",
			source = " ",
			start = " ",
			task = "✔ ",
			list = {
				"●",
				"➜",
				"★",
				"‒",
			},
		},
	},
})
