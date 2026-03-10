return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  opts = {
	  view = {
		  width = 40,
	  },
  },
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
	  { "<leader>ntt", ":NvimTreeToggle<CR>"},
	  { "<leader>ntf", ":NvimTreeFocus<CR>"},
  },
  config = function(_, opts)
    require("nvim-tree").setup(opts)
  end,
}
