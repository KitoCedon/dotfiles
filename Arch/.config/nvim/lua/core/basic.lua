-- 设置行号显示
vim.opt.number = true
vim.opt.relativenumber = true

-- 设置行列高亮
vim.opt.cursorline = true
-- vim.opt.colorcolumn = "80"

-- 设置制表符宽度
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.shiftwidth = 0

-- 键位映射
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- 其他设置
vim.opt.autoread = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.diagnostic.config({ virtual_text = true })
vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
        },
    },
})

