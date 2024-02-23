return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = { "BufReadPre", "BufNewFile" },
  keys = {
    { "<leader>tt", "<cmd>TroubleToggle quickfix<cr>", { desc = "Open a quickfix" } },
  },

  opts = {},
  config = function()
    require("trouble").setup({
      auto_open = false,
      auto_close = false,
      auto_preview = true,
      auto_jump = {},
      mode = "quickfix",
      severity = vim.diagnostic.severity.ERROR,
      cycle_results = false,
    })

    vim.api.nvim_create_autocmd("User", {
      pattern = { "XcodebuildBuildFinished", "XcodebuildTestsFinished" },
      callback = function(event)
        if event.data.cancelled then
          return
        end

        if event.data.success then
          require("trouble").close()
        elseif not event.data.failedCount or event.data.failedCount > 0 then
          if next(vim.fn.getqflist()) then
            require("trouble").open({ focus = false })
          else
            require("trouble").close()
          end

          require("trouble").refresh()
        end
      end,
    })
  end,
}
