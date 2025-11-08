return {
	"MannuVilasara/snacks-music-player.nvim",
	dependencies = { "folke/snacks.nvim" },
	opts = {},
	keys = {
		{
			"<leader>mp",
			function()
				require("snacks-music-player").toggle()
			end,
			desc = "Toggle Music Player UI",
		},
		{
			"<leader>m<space>",
			function()
				require("snacks-music-player").play_pause()
			end,
			desc = "Play/Pause Music",
		},
		{
			"<leader>mn",
			function()
				require("snacks-music-player").next()
			end,
			desc = "Next Track",
		},
		{
			"<leader>mb",
			function()
				require("snacks-music-player").previous()
			end,
			desc = "Previous Track",
		},
	},
}
