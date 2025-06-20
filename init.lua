require("config.lazy")

vim.opt.showmode = true -- 在底部显示当前模式（插入、命令等）。
vim.opt.showcmd = true -- 命令模式下，在底部显示当前键入的指令。

vim.opt.termguicolors = true -- 启用真彩色支持。这是 `set t_Co=256` 的现代替代，
-- 如果你的终端支持真彩色，效果会更好。
-- 如果你的终端不支持真彩色，可以设置为 false 或删除。

vim.opt.mouse = "a" -- 支持使用鼠标。
vim.opt.encoding = "utf-8" -- 使用 utf-8 编码。
vim.opt.fileencoding = "utf-8" -- 文件编码也设置为 utf-8。
vim.opt.autoindent = true -- 按下回车键后，下一行的缩进会自动跟上一行的缩进保持一致。
vim.opt.number = true -- 显示行数。

vim.opt.expandtab = true -- 将制表符输入转换为空格。
vim.opt.tabstop = 4 -- 一个制表符显示为4个空格的宽度。
vim.opt.shiftwidth = 4 -- 自动缩进时使用的空格数。
vim.opt.softtabstop = 4 -- 按下Tab键或:Backspace键时，移动的逻辑宽度。

vim.g.mapleader = " "
-- 定义“前缀键”

-- 确保 Neovim 编译时带有 +clipboard 特性 (通常是默认的)
-- 设置 'unnamedplus' 选项，使 Neovim 的默认寄存器 ('+') 与系统剪贴板同步
vim.opt.clipboard = "unnamedplus"

-- 配置 Neovim 使用 wl-copy 和 wl-paste 命令进行剪贴板操作
-- 这是 Wayland 环境下最常用且可靠的配置
vim.g.clipboard = {
  name = "wl-clipboard",
  copy = {
    ["+"] = "wl-copy",
    ["*"] = "wl-copy", -- '*' 寄存器通常用于 X11 的 PRIMARY selection，Wayland 也可以映射
  },
  paste = {
    ["+"] = "wl-paste",
    ["*"] = "wl-paste",
  },
  cache_enabled = 0, -- 禁用缓存，以确保实时同步
}
