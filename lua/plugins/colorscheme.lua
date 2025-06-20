return {
  {
    "Mofiqul/dracula.nvim", -- 官方 Dracula 主题
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("dracula") -- 应用主题
    end,
  },
}
