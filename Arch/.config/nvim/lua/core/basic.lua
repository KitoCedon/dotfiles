-- 命令前置符置
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- 设置行号显示
vim.opt.number = true
vim.opt.relativenumber = true

-- 设置行列高亮
vim.opt.cursorline = true
-- vim.opt.colorcolumn = "80"

-- 如果查找的内容中不存在大写，则大小写不敏感
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- 设置制表符宽度
vim.opt.tabstop = 4
vim.opt.expandtab = false
vim.opt.shiftwidth = 0

-- 查找高亮匹配结果
-- vim.opt.hlsearch = false -- 关闭查找后高亮
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>") -- Esc手动关闭

-- 剪贴板设置
vim.opt.clipboard = "unnamedplus"
-- 将删除键(d)的内容保存到黑洞寄存器
vim.keymap.set({ "n", "v" }, "d", '"_d')
-- Normal Mode 下的删除单个字符和Change也不同步到系统剪贴板
vim.keymap.set("n", "x", '"_x')
vim.keymap.set("n", "c", '"_c')

-- vim.g.clipboard = "wl-copy"

-- Terminal Mode 设置
-- Terminal Mode 下按 <Esc><Esc> 快速退出到 Normal 模式
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { silent = true })
-- Terminal Mode 下使用 <C-h/j/k/l> 跳转到其他窗口
vim.keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h", { silent = true })
vim.keymap.set("t", "<C-j>", "<C-\\><C-n><C-w>j", { silent = true })
vim.keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k", { silent = true })
vim.keymap.set("t", "<C-l>", "<C-\\><C-n><C-w>l", { silent = true })

-- 编码设置
vim.o.fileencodings = 'ucs-bom,utf-8,gbk,cp936,latin-1'

-- 其他设置
vim.opt.autoread = true
vim.opt.splitbelow = true
vim.opt.splitright = true

-- 诊断信息设置
vim.diagnostic.config({ virtual_text = true})
vim.keymap.set('n', "<leader>e", ":lua vim.diagnostic.open_float()<CR>")

-- 配置折叠
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldmethod = "expr"
-- 默认不折叠
vim.opt.foldlevel = 99
-- 显示折叠栏
vim.opt.foldcolumn = "2"

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
