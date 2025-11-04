-- vim.cmd("set expandtab")
-- vim.cmd("set tabstop=2")
-- vim.cmd("set softtabstop=2")
-- vim.cmd("set shiftwidth=2")
-- vim.cmd("set rnu")

--vim options

vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

opt.wrap = true

-- search settings
opt.ignorecase = true
opt.smartcase = true

opt.cursorline = true

-- appearance

opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- split
opt.splitright = true
opt.splitbelow = true

-- keybindings

vim.g.mapleader = " "

vim.opt.swapfile = false

-- Navigate vim panes better
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>", { desc = "Navigate up" })
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>", { desc = "Navigate down" })
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>", { desc = "Navigate left" })
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>", { desc = "Navigate right" })

-- Navigate vim panes with Ctrl+Arrow keys
vim.keymap.set("n", "<C-Up>", ":wincmd k<CR>", { desc = "Navigate up" })
vim.keymap.set("n", "<C-Down>", ":wincmd j<CR>", { desc = "Navigate down" })
vim.keymap.set("n", "<C-Left>", ":wincmd h<CR>", { desc = "Navigate left" })
vim.keymap.set("n", "<C-Right>", ":wincmd l<CR>", { desc = "Navigate right" })

vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>", { desc = "Clear search highlights" })
vim.wo.number = true

-- window management

local keymap = vim.keymap

keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make split equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- lazydocker
-- vim.keymap.set("n", "<leader>ld", "<cmd>lazydocker<CR>", { desc = "Open Lazydocker" })

-- toggleterm
vim.keymap.set("n", "<leader>1", "<cmd>ToggleTerm<CR>", { desc = "Toggle term" })

-- nerdy keymaps
vim.keymap.set("n", "<leader>in", "<cmd>Nerdy<CR>", { desc = "Icons" })

-- diagnostic keymaps
vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	underline = true,
	update_in_insert = false,
	float = {
		border = "rounded",
		source = "always",
	},
})
