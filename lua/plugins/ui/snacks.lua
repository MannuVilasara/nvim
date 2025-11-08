return {
	"folke/snacks.nvim",
	dependencies = {
		"echasnovski/mini.icons",
	},
	priority = 1000,
	lazy = false,
	opts = {
		bigfile = { enabled = true },
		dashboard = {
			enabled = true,
			preset = {
				header = [[
                mannu                                                
       ████ ██████           █████      ██                     
      ███████████             █████                             
      █████████ ███████████████████ ███   ███████████   
     █████████  ███    █████████████ █████ ██████████████   
    █████████ ██████████ █████████ █████ █████ ████ █████   
  ███████████ ███    ███ █████████ █████ █████ ████ █████  
 ██████  █████████████████████ ████ █████ █████ ████ ██████ 
        ]],
			},
			sections = {
				{ section = "header" },
				{ section = "keys", gap = 1, padding = 2 },
				function()
					local handle = io.popen("playerctl metadata --format '{{artist}}|||{{title}}' 2>/dev/null")
					local result = handle:read("*a")
					handle:close()

					if result and result ~= "" then
						local artist, title = result:match("(.-)|||(.+)")
						if artist and title then
							artist = artist:gsub("^%s*(.-)%s*$", "%1")
							title = title:gsub("^%s*(.-)%s*$", "%1")
							return {
								align = "center",
								text = {
									{ "♫ Now Playing: ", hl = "SnacksDashboardIcon" },
									{ artist, hl = "Special" },
									{ " - ", hl = "SnacksDashboardDesc" },
									{ title, hl = "String" },
								},
							}
						end
					end

					return {
						align = "center",
						text = {
							{ "♫ No music playing", hl = "Comment" },
						},
					}
				end,
				{
					text = "─",
					align = "center",
					hl = "SnacksDashboardSpecial",
				},
				{ section = "startup", padding = 1 },
			},
		},
		indent = { enabled = true },
		input = { enabled = true },
		git = { enabled = true },
		picker = { enabled = true },
		notifier = { enabled = true },
		quickfile = { enabled = true },
		scroll = { enabled = false },
		statuscolumn = { enabled = true },
		words = { enabled = true },
		win = { enabled = true },
		styles = {
			notification = {
				wo = { wrap = true },
			},
		},
	},
	keys = {
		{
			"<leader>sf",
			function()
				Snacks.scratch()
			end,
			desc = "Toggle Scratch Buffer",
		},
		{
			"<leader>S",
			function()
				Snacks.scratch.select()
			end,
			desc = "Select Scratch Buffer",
		},
		{
			"<leader>gl",
			function()
				Snacks.lazygit.log_file()
			end,
			desc = "Lazygit Log (cwd)",
		},
		{
			"<leader>lg",
			function()
				Snacks.lazygit()
			end,
			desc = "Lazygit",
		},
		{
			"<C-p>",
			function()
				Snacks.picker.pick("files")
			end,
			desc = "Find Files",
		},
		{
			"<leader><leader>",
			function()
				Snacks.picker.recent()
			end,
			desc = "Recent Files",
		},
		{
			"<leader>fb",
			function()
				Snacks.picker.buffers()
			end,
			desc = "Buffers",
		},
		{
			"<leader>fg",
			function()
				Snacks.picker.grep()
			end,
			desc = "Grep Files",
		},
		{
			"<leader>ee",
			function()
				Snacks.explorer.open()
			end,
			desc = "Explorer",
		},
		{
			"<leader>p",
			function()
				Snacks.picker.pick("commands")
			end,
			desc = "Command Palette",
		},
		{
			"<leader>fh",
			function()
				Snacks.picker.help()
			end,
			desc = "Help Pages",
		},
		{
			"<leader>fc",
			function()
				Snacks.picker.colorschemes()
			end,
			desc = "Colorschemes",
		},
		{
			"<leader>fk",
			function()
				Snacks.picker.keymaps()
			end,
			desc = "Keymaps",
		},
	},
}
