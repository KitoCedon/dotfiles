-- 设置行号显示
vim.opt.number = true
vim.opt.relativenumber = true

-- 设置行列高亮
vim.opt.cursorline = true
-- vim.opt.colorcolumn = "80"

-- 设置制表符宽度
vim.opt.tabstop = 4
vim.opt.expandtab = false
vim.opt.shiftwidth = 0

-- 部分键位映射
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- 剪贴板设置
vim.opt.clipboard = "unnamedplus"
-- vim.g.clipboard = "wl-copy"

-- 其他设置
vim.opt.autoread = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.diagnostic.config({ virtual_text = true })

-- 格式化命令设置
vim.g.disable_autoformat = true -- 默认禁用自动格式化

vim.api.nvim_create_user_command("FormatDisable", function(args)
	if args.bang then
		-- FormatDisable! will disable formatting just for this buffer
		vim.b.disable_autoformat = true
	else
		vim.g.disable_autoformat = true
	end
end, {
	desc = "Disable autoformat-on-save",
	bang = true,
})

vim.api.nvim_create_user_command("FormatEnable", function()
	vim.b.disable_autoformat = false
	vim.g.disable_autoformat = false
end, {
	desc = "Re-enable autoformat-on-save",
})
