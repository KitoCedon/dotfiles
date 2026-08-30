return {
	"olimorris/onedarkpro.nvim",
	lazy = false,
	priority = 1000, -- Ensure it loads first
	opts = {
		options = {
			transparency = false,
		},
	},
	config = function(_, opts)
		require("onedarkpro").setup(opts)
		vim.cmd("colorscheme onedark")
	end,
}
