vim.lsp.config["lua_ls"] = {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
}

vim.api.nvim_create_autocmd("FileType", {
	pattern = "html",
	callback = function()
		require("otter").activate({ "javascript", "css" })
	end,
})
-- vue 配置
local vue_language_server_path = vim.fn.stdpath("data")
	.. "/mason/packages/vue-language-server/node_modules/@vue/language-server"

vim.lsp.config["vtsls"] = {
	settings = {
		vtsls = {
			tsserver = {
				globalPlugins = {
					{
						name = "@vue/typescript-plugin",
						location = vue_language_server_path,
						languages = { "vue" },
						configNamespace = "typescript",
					},
				},
			},
		},
	},
	filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
}

-- JDTLS 配置
-- Lombok：通过 javaagent 让 jdtls 识别 @Data/@Slf4j 等生成的代码
vim.env.JDTLS_JVM_ARGS = "-javaagent:"
    .. vim.fn.stdpath("data") .. "/mason/share/jdtls/lombok.jar"

-- 由mason-lspconfig自动启用
-- vim.lsp.enable('marksman')
-- vim.lsp.enable('lua_ls')
