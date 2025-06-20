-- lua/user/plugins/cmp.lua

return {
  -- nvim-cmp 核心插件
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp", -- LSP 补全源
      "hrsh7th/cmp-buffer", -- 缓冲区补全源
      "hrsh7th/cmp-path", -- 路径补全源
      "hrsh7th/cmp-cmdline", -- 命令行补全源
      "saadparwaiz1/cmp_luasnip", -- luasnip 补全源
      "L3MON4D3/LuaSnip", -- 代码片段引擎
      "rafamadriz/friendly-snippets", -- 常用代码片段
      "onsails/lspkind.nvim", -- 补全图标
      "nvim-tree/nvim-web-devicons", -- 确保图标显示
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      local lspkind = require("lspkind")

      -- 启用 friendly-snippets
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        snippet = {
          -- REQUIRED - 告诉 nvim-cmp 如何展开代码片段
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        formatting = {
          format = lspkind.cmp_format({
            mode = "symbol", -- show only symbol annotations
            maxwidth = 50, -- prevent the popup from showing more than 50 characters
            ellipsis_char = "...", -- when maxwidth is reached, this is used
            -- The `menu` is typically the source name. Here we add icons to it.
            before = function(entry, vim_item)
              -- Source: https://github.com/hrsh7th/nvim-cmp/wiki/Menu-Appearance#adding-icons
              vim_item.menu = ({
                buffer = "[Buffer]",
                nvim_lsp = "[LSP]",
                luasnip = "[Snippet]",
                path = "[Path]",
                cmdline = "[Cmd]",
              })[entry.source.name]
              return vim_item
            end,
          }),
        },
        -- VSCode 风格的快捷键设置
        mapping = cmp.mapping.preset.insert({
          -- Tab 键行为:
          -- 1. 如果补全菜单可见，选择下一个补全项。
          -- 2. 如果有可展开或可跳转的代码片段，则展开或跳转。
          -- 3. 否则，插入一个 Tab 字符。
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }), -- 'i' for insert mode, 's' for snippet mode

          -- Shift+Tab 键行为:
          -- 1. 如果补全菜单可见，选择上一个补全项。
          -- 2. 如果有可跳转的代码片段，则跳回上一个位置。
          -- 3. 否则，插入一个 Shift+Tab 字符 (通常是反向缩进)。
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),

          -- Enter 键: 确认选择的补全项
          -- { select = true } 表示如果只有一个补全项，自动选中并确认
          ["<CR>"] = cmp.mapping.confirm({ select = true }),

          -- Ctrl+Space: 手动触发补全
          ["<C-Space>"] = cmp.mapping.complete(),
        }),

        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          {
            name = "buffer",
            -- 只有当输入了至少 2 个字符时才从缓冲区获取补全
            option = {
              keyword_length = 2,
              -- 也可以设置 trigger_characters = {} 来禁用自动触发，只通过 C-Space 触发
              -- trigger_characters = {},
            },
          },
          {
            name = "path",
            -- 只有当输入了至少 1 个字符时才从路径获取补全
            option = {
              keyword_length = 1,
              -- 路径补全通常在输入 '/' 或 '.' 时触发，可以根据需要调整
              -- trigger_characters = { '/', '.' },
            },
          },
        }),
        -- 也可以为所有源设置一个全局的 min_length
        -- min_length = 1, -- 只有输入了至少1个字符才触发补全
      })

      --      -- 设置命令行模式下的补全 (例如在输入 : 时)
      --      cmp.setup.cmdline(":", {
      --        mapping = cmp.mapping.preset.cmdline(),
      --        sources = cmp.config.sources({
      --          { name = "cmdline" },
      --        }),
      --      })
      --
      --      -- 设置搜索模式下的补全 (例如在输入 / 或 ? 时)
      --      cmp.setup.cmdline({ "/", "?" }, {
      --        mapping = cmp.mapping.preset.cmdline(),
      --        sources = {
      --          { name = "buffer" },
      --        },
      --      })
    end,
  },
}
