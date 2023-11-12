return {
  "Mofiqul/dracula.nvim",
  name = "dracula",
  priority = 1000,
  config = function()
    local colors = require("dracula").colors()
    local searchHighlight = { bg = "#3e68d7", fg = colors.fg }

    require("dracula").setup({
      colors = {
        bright_red = colors.comment,
      },
      transparent_bg = false,
      overrides = {
        CursorLine = { bg = colors.selection },
        FlashLabel = { bg = "#FF007C", bold = true },
        Search = searchHighlight,
        IncSearch = searchHighlight,
        FlashMatch = searchHighlight,
        FlashCurrent = searchHighlight,
      },
    })

    vim.cmd([[colorscheme dracula]])
  end,
}
