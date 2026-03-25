-- --- 基础选项设置 ---
local opt = vim.opt

opt.number = true
opt.relativenumber = false
opt.expandtab = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.mouse = 'a'
opt.clipboard = 'unnamedplus'
opt.termguicolors = true
opt.signcolumn = 'yes'
opt.updatetime = 300
opt.completeopt = { 'menuone', 'noselect' }

-- 快捷键设置 (Leader)
vim.g.mapleader = " "

-- 记住最后编辑位置
vim.api.nvim_create_autocmd('BufReadPost', {
  pattern = '*',
  callback = function()
    local line = vim.fn.line("'\"")
    if line > 1 and line <= vim.fn.line('$') then
      vim.cmd('normal! g\'"')
    end
  end,
})

-- 简单的文件树快捷键
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { silent = true })
-- Telescope 搜索文件快捷键
vim.keymap.set('n', '<leader>ff', ':Telescope find_files<CR>', { silent = true })
vim.keymap.set('n', '<leader>fg', ':Telescope live_grep<CR>', { silent = true })

-- 打开插件管理器 Lazy
vim.keymap.set('n', '<leader>l', ':Lazy<CR>', { silent = true })

-- Markdown 预览快捷键
vim.keymap.set('n', '<leader>mp', ':MarkdownPreview<CR>', { silent = true })
vim.keymap.set('n', '<leader>ms', ':MarkdownPreviewStop<CR>', { silent = true })
