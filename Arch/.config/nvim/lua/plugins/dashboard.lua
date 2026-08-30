return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	config = function()
		require("dashboard").setup({
			theme = "doom",
			config = {
				header = {
					"",
					" ██████╗ ██████╗ ██╗     ██████╗ ██╗   ██╗██╗███╗   ███╗",
					"██╔════╝██╔═══██╗██║     ██╔══██╗██║   ██║██║████╗ ████║",
					"██║     ██║   ██║██║     ██║  ██║██║   ██║██║██╔████╔██║",
					"██║     ██║   ██║██║     ██║  ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
					"╚██████╗╚██████╔╝███████╗██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
					" ╚═════╝ ╚═════╝ ╚══════╝╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
					"",
				},
				center = {
					{
						icon = " ",
						icon_hl = "Title",
						desc = "        Telescope files",
						desc_hl = "group",
						key = "e",
						key_hl = "FloatTitle",
						key_format = " [%s]", -- `%s` will be substituted with value of `key`
						action = "Telescope find_files",
					},
				},
				footer = {},
				vertical_center = false, -- Center the Dashboard on the vertical (from top to bottom)
			},
		})
	end,
	dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
