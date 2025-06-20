return {
  -- install without yarn or npm
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = "npm install",
    --    并不工作，见github issue
    --    build = function() vim.fn["mkdp#util#install"]() end,
  },
}
