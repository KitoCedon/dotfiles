return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    -- dashboard = { enabled = true },
    -- explorer = { enabled = true },
    picker = { enabled = true },
    quickfile = { enabled = true },
    -- scope = { enabled = true },
    -- scroll = { enabled = true },
    -- statuscolumn = { enabled = true },
    words = { enabled = true },
	image = { enabled = true },
	git = { enabled = true },
	gh = { enabled = true }
  },
  keys = {
	  { "<leader>ntt", ":lua Snacks.explorer.open()<CR>"},
  },
}
