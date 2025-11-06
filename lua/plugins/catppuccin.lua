return {
	{
		"catppuccin/nvim",
		-- enabled = false,
		lazy = false,
		name = "catppuccin",
		priority = 1000,

		config = function()
			local transparent = true -- Set to false to disable transparency

			require("catppuccin").setup({
				transparent_background = transparent,
				integrations = {
					cmp = true,
					gitsigns = true,
					nvimtree = true,
					treesitter = true,
					notify = false,
					mini = {
						enabled = true,
						indentscope_color = "",
					},
					snacks = true,
					which_key = true,
					fidget = true,
					mason = true,
					native_lsp = {
						enabled = true,
						virtual_text = {
							errors = { "italic" },
							hints = { "italic" },
							warnings = { "italic" },
							information = { "italic" },
						},
						underlines = {
							errors = { "underline" },
							hints = { "underline" },
							warnings = { "underline" },
							information = { "underline" },
						},
					},
				},
				custom_highlights = function(colors)
					if not transparent then
						return {}
					end
					return {
						-- Make these backgrounds transparent
						-- You can add more if you find other plugins that need it
						-- You can also disable transparency for specific plugins here
						NormalFloat = { bg = colors.none },
						FloatBorder = { bg = colors.none },
						TelescopeNormal = { bg = colors.none },
						TelescopeBorder = { bg = colors.none },
						NvimTreeNormal = { bg = colors.none },
						NvimTreeNormalNC = { bg = colors.none },
						SnacksNormal = { bg = colors.none },
						SnacksDashboardNormal = { bg = colors.none },
						WhichKeyFloat = { bg = colors.none },
						LspInfoBorder = { bg = colors.none },
						BufferLineFill = { bg = colors.none },
					}
				end,
			})
			vim.cmd.colorscheme("catppuccin-mocha")
		end,
	},
}
