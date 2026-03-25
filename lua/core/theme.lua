-- --- 主题设置 (基于用户提供的 Base16) ---
local c = {
  base00 = "#121215", base01 = "#1A1A1D", base02 = "#4D4F60", base03 = "#626473",
  base04 = "#9A9AAD", base05 = "#E0E0D8", base06 = "#F0F0E8", base07 = "#FCFCF8",
  base08 = "#FF5555", base09 = "#FFB86C", base0A = "#FFF08C", base0B = "#7BC98D",
  base0C = "#8BE9FD", base0D = "#FF8888", base0E = "#FF79C6", base0F = "#BD93F9",
}

local function hl(group, options)
  vim.api.nvim_set_hl(0, group, options)
end

-- 基础 UI
hl("Normal", { fg = c.base05, bg = c.base00 })
hl("CursorLine", { bg = c.base01 })
hl("LineNr", { fg = c.base03 })
hl("CursorLineNr", { fg = c.base0D, bold = true })
hl("Visual", { bg = c.base02 })
hl("Search", { bg = c.base0A, fg = c.base00 })
hl("IncSearch", { bg = c.base09, fg = c.base00 })
hl("StatusLine", { fg = c.base04, bg = c.base02 })
hl("VertSplit", { fg = c.base02, bg = c.base00 })
hl("ColorColumn", { bg = c.base01 })

-- 语法基础
hl("Comment", { fg = c.base03, italic = true })
hl("String", { fg = c.base0B })
hl("Number", { fg = c.base09 })
hl("Keyword", { fg = c.base0E, bold = true })
hl("Function", { fg = c.base0D })
hl("Statement", { fg = c.base0E })
hl("Type", { fg = c.base0A })
hl("Identifier", { fg = c.base08 })
hl("Special", { fg = c.base0C })

-- Treesitter 映射
hl("@variable", { fg = c.base05 })
hl("@function", { fg = c.base0D })
hl("@keyword", { fg = c.base0E, bold = true })
hl("@property", { fg = c.base08 })
hl("@type", { fg = c.base0A })
hl("@string", { fg = c.base0B })
hl("@constant", { fg = c.base09 })
hl("@parameter", { fg = c.base08 })

-- LSP 诊断颜色
hl("DiagnosticError", { fg = c.base08 })
hl("DiagnosticWarn", { fg = c.base0A })
hl("DiagnosticInfo", { fg = c.base0D })
hl("DiagnosticHint", { fg = c.base0C })

-- 补全菜单 (Pmenu)
hl("Pmenu", { bg = c.base01, fg = c.base05 })
hl("PmenuSel", { bg = c.base0D, fg = c.base00 })

-- 侧边栏/文件树高亮
hl("NvimTreeNormal", { bg = c.base01, fg = c.base05 })
hl("NvimTreeEndOfBuffer", { fg = c.base01 })
