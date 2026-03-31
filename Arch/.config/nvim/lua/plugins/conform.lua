return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			-- Conform will run multiple formatters sequentially
			-- python = { "isort", "black" },
			-- sh = { "beautysh" },
			sh = { "shfmt" },
			python = { "black" },
			-- You can customize some of the format options for the filetype (:help conform.format)
			-- rust = { "rustfmt", lsp_format = "fallback" },
			-- Conform will run the first available formatter
			javascript = { "prettierd", stop_after_first = true },
			markdown = { "prettierd" },
		},
		-- 写入时格式化
		format_on_save = function(bufnr)
			-- Disable with a global or buffer-local variable
			if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
				return
			end
			return { timeout_ms = 500, lsp_format = "fallback" }
		end,
	},
	config = function(_, opts)
		require("conform").setup(opts)

		-- 自动安装formatters_by_ft中的缺失项(使用Mason API)
		local install_formatters = function()
			local registry = require("mason-registry")

			local pkgs = {}

			for _, formatters in pairs(opts.formatters_by_ft) do
				for _, i in ipairs(formatters) do
					if type(i) == "string" then
						table.insert(pkgs, i)
					end
				end
			end

			registry.refresh(function()
				for _, i in ipairs(pkgs) do
					local ok, pkg = pcall(registry.get_package, i)
					if ok then
						if not pkg:is_installed() then
							pkg:install()
						end
					end
				end
			end)
		end

		install_formatters()
	end,
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format()
			end,
		},
	},
}
