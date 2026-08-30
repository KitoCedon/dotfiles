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
			java = { "google-java-format", "unexpand" },
			-- You can customize some of the format options for the filetype (:help conform.format)
			-- rust = { "rustfmt", lsp_format = "fallback" },
			-- Conform will run the first available formatter
			javascript = { "prettierd", stop_after_first = true },
			markdown = { "prettierd" },
			html = { "superhtml" },
			css = { "prettier" },
			typescript = { "prettier" },
			vue = { "prettier" },
		},
		formatters = {
			unexpand = {
				command = "unexpand",
				args = { "--tabs=4", "--first-only" },
			},
			["google-java-format"] = {
				append_args = { "--aosp" },
			},
			prettier = {
				prepend_args = { "--use-tabs", "--tab-width", "4" },
			},
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
		-- require("conform").formatters.google_java_format = { append_args = { "--indent-width", "4" } }

		-- 自动安装formatters_by_ft中的缺失项(使用Mason API)
		local install_formatters = function()
			local registry = require("mason-registry")

			local pkgs = {}
			local native_cmd = { "unexpand" }

			for _, formatters in pairs(opts.formatters_by_ft) do
				for _, i in ipairs(formatters) do
					if type(i) == "string" then
						table.insert(pkgs, i)
					end
				end
			end

			-- 跳过本地命令
			local is_in_table = function(table, element)
				for _, i in ipairs(table) do
					if i == element then
						return true
					end
					return false
				end
			end

			registry.refresh(function()
				for _, i in ipairs(pkgs) do
					-- 模拟continue关键字, 跳过本地指令
					repeat
						if is_in_table(native_cmd, i) then
							break
						end

						local ok, pkg = pcall(registry.get_package, i)
						if ok then
							if not pkg:is_installed() then
								pkg:install()
								vim.notify("Conform: [Mason] 正在安装包:" .. i)
								-- vim.cmd(string.format("MasonInstall %s", pkg.name))
							end
						else
							vim.notify("Conform: [Mason] 找不到包:" .. i, vim.log.levels.WARN)
						end

					until true
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
