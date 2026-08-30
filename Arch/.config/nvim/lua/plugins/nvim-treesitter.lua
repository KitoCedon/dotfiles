return {
	"nvim-treesitter/nvim-treesitter",
	-- main = "nvim-treesitter.configs", -- 配置setup时的模块名称
	-- branch = "master", -- 使用master分支向下兼容Neovim 0.11
	branch = "main", -- 使用main分支兼容Neovim 0.12
	lazy = false,
	-- enabled = false,
	build = ":TSUpdate",
	opts = {
		ensure_installed = { "lua", "vim", "vimdoc" },
		-- ensure_installed = { "java", "lua", "python", "c", "bash" },
		highlight = { enable = true },
	},
	enabled = false
}
