return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")

    local function xcodebuild_device()
      if vim.g.xcodebuild_platform == "macOS" then
        return " macOS"
      end

      if vim.g.xcodebuild_os then
        return " " .. vim.g.xcodebuild_device_name .. " (" .. vim.g.xcodebuild_os .. ")"
      end

      return " " .. vim.g.xcodebuild_device_name
    end

    lualine.setup({
      options = {
        globalstatus = true,
        theme = "auto",
        symbols = {
          alternate_file = "#",
          directory = "",
          readonly = "",
          unnamed = "[No Name]",
          newfile = "[New]",
        },
        disabled_buftypes = { "quickfix", "prompt" },
        component_separators = "",
        section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = {
          -- { "mode" },
          { "filename" },
        },
        lualine_b = {
          { "diagnostics" },
          { "diff" },
          {
            "searchcount",
            maxcount = 999,
            timeout = 500,
          },
        },
        lualine_c = {},
        lualine_x = {
          { "' ' .. vim.g.xcodebuild_last_status", color = { fg = "#a6e3a1" } },
          -- { "'󰙨 ' .. vim.g.xcodebuild_test_plan", color = { fg = "#a6e3a1", bg = "#161622" } },
          { xcodebuild_device, color = { fg = "#f9e2af", bg = "#161622" } },
        },
        lualine_y = {
          { "branch" },
        },
        lualine_z = {
          { "location" },
        },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
      extensions = { "nvim-dap-ui", "quickfix", "trouble", "nvim-tree", "lazy", "mason" },
    })
  end,
}
