return {
	"nvim-lualine/lualine.nvim",
	opts = function(_, opts)
		-- 初始化 sections
		opts.sections = {}
		opts.sections.lualine_x = {}

		-- 定义字数统计函数
		local function word_count()
			if vim.fn.mode() == "v" or vim.fn.mode() == "V" or vim.fn.mode() == "\22" then
				-- 可视模式下统计选中的字数
				return string.format(
					"󰈭 %d Words %d Chars",
					vim.fn.wordcount().visual_words,
					vim.fn.wordcount().visual_chars
				)
			else
				-- 普通模式下统计整个文件的字数
				return string.format(
					"󰈭 %d Words %d Chars",
					vim.fn.wordcount().words,
					vim.fn.wordcount().chars
				)
			end
		end

		-- 在 lualine_x 部分加入
		-- table.insert(opts.sections.lualine_x, 1, { word_count, 'encoding', 'fileformat', 'filetype'} )
		opts.sections.lualine_x = { word_count, "encoding", "fileformat", "filetype" }
	end,
	dependencies = { "nvim-tree/nvim-web-devicons" },
}
