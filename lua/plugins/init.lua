-- --- Bootstrap Lazy.nvim ---
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- --- 插件列表 ---
require("lazy").setup({
  -- 语法高亮
  { 
    "nvim-treesitter/nvim-treesitter", 
    build = ":TSUpdate",
    config = function()
      local status, ts = pcall(require, "nvim-treesitter.configs")
      if not status then return end
      ts.setup {
        ensure_installed = { "lua", "vim", "markdown", "markdown_inline" },
        highlight = { enable = true },
      }
    end
  },

  -- LSP 系统 (基础)
  { "neovim/nvim-lspconfig" },
  { "williamboman/mason.nvim", config = true },
  { 
    "williamboman/mason-lspconfig.nvim",
    config = function()
      local status, ml = pcall(require, "mason-lspconfig")
      if not status then return end
      ml.setup({ ensure_installed = { "lua_ls" } })
      if ml.setup_handlers then
        ml.setup_handlers({
          function (server_name)
            require("lspconfig")[server_name].setup {}
          end,
        })
      end
    end
  },

  -- 补全引擎
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer", "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip", "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local status, cmp = pcall(require, "cmp")
      if not status then return end
      cmp.setup({
        snippet = { expand = function(args) require('luasnip').lsp_expand(args.body) end },
        mapping = cmp.mapping.preset.insert({
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then cmp.select_next_item() else fallback() end
          end, { 'i', 's' }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then cmp.select_prev_item() else fallback() end
          end, { 'i', 's' }),
        }),
        sources = cmp.config.sources({ { name = 'nvim_lsp' }, { name = 'luasnip' } }, { { name = 'buffer' } })
      })
    end
  },

  -- 快捷键提示 (新加：Which-Key)
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      local wk = require("which-key")
      wk.setup({
        preset = "modern", -- 使用现代化的界面
        win = { border = "rounded" }, -- 圆角窗口
      })
      -- 注册中文描述
      wk.add({
        { "<leader>e", desc = "打开/关闭文件树" },
        { "<leader>f", group = "文件查找" },
        { "<leader>ff", desc = "搜索文件名" },
        { "<leader>fg", desc = "搜索全局文本 (Live Grep)" },
        { "<leader>l", desc = "打开插件管理器 (Lazy)" },
        { "<leader>m", group = "Markdown 预览" },
        { "<leader>mp", desc = "开启 Markdown 预览" },
        { "<leader>ms", desc = "停止 Markdown 预览" },
      })
    end
  },

  -- 文件浏览器
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({
        view = { width = 30 },
        renderer = { icons = { show = { file = true, folder = true } } }
      })
    end
  },

  -- 模糊搜索
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = true
  },

  -- 工具
  {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")
      dashboard.section.header.val = _G.dashboard_header
      dashboard.section.buttons.val = {
        dashboard.button("f", "  查找文件", ":Telescope find_files <CR>"),
        dashboard.button("g", "󰱽  搜索文本", ":Telescope live_grep <CR>"),
        dashboard.button("l", "󰒲  插件管理 (Lazy)", ":Lazy<CR>"),
        dashboard.button("n", "  新建文件", ":ene <BAR> startinsert <CR>"),
        dashboard.button("q", "󰈆  退出", ":qa<CR>"),
      }
      alpha.setup(dashboard.config)
    end
  },
  { 
    "iamcco/markdown-preview.nvim", 
    ft = { "markdown" }, -- 只有打开 markdown 文件时才加载
    build = "cd app && npm install",
    init = function() 
      vim.g.mkdp_filetypes = { "markdown" }
    end,
  },
})
