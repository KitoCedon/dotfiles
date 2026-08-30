return {
	"mason-org/mason-lspconfig.nvim",
	opts = {
		ensure_installed = { "lua_ls", "marksman", "bashls", "jdtls", "basedpyright", "superhtml", "vtsls", "cssls", "emmet_language_server" , "rust_analyzer", "vue_ls"},
	},
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		"neovim/nvim-lspconfig",
		"saghen/blink.cmp",
	},
}
