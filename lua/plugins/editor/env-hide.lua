return {
	"MannuVilasara/env-hide.nvim",
	-- event = "BufRead",
	config = function()
		require("env-hide").setup()
	end,
}
