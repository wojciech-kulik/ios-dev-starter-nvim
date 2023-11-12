return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "wojciech-kulik/xcodebuild.nvim",
  },
  config = function()
    local dap = require("dap")
    local xcodebuild = require("xcodebuild.dap")
    local breakpoints = require("starter.plugins.nvim-dap.dap-remember-breakpoints")
    local autogroup = vim.api.nvim_create_augroup("dap-breakpoints", { clear = true })
     
    vim.api.nvim_create_autocmd({ "VimEnter" }, {
      group = autogroup,
      pattern = "*",
      once = true,
      callback = function()
        vim.defer_fn(breakpoints.load, 500)
      end,
    })

    dap.configurations.swift = {
      {
        name = "iOS App Debugger",
        type = "codelldb",
        request = "attach",
        program = xcodebuild.get_program_path,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        waitFor = true,
      },
    }

    dap.adapters.codelldb = {
      type = "server",
      port = "13000",
      executable = {
        -- TODO: make sure to set path to your codelldb
        command = os.getenv("HOME") .. "/Downloads/codelldb-aarch64-darwin/extension/adapter/codelldb",
        args = {
          "--port",
          "13000",
          "--liblldb",
          -- TODO: make sure that this path is correct on your machine
          "/Applications/Xcode.app/Contents/SharedFrameworks/LLDB.framework/Versions/A/LLDB",
        },
      },
    }

    -- nice breakpoint icons
    vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticError", linehl = "", numhl = "" })
    vim.fn.sign_define(
      "DapBreakpointRejected",
      { text = "", texthl = "DiagnosticError", linehl = "", numhl = "" }
    )

    -- integration with xcodebuild.nvim
    vim.keymap.set("n", "<leader>dd", xcodebuild.build_and_debug, { desc = "Build & Debug" })
    vim.keymap.set("n", "<leader>dr", xcodebuild.debug_without_build, { desc = "Debug Without Building" })

    vim.keymap.set("n", "<leader>dc", dap.continue)
    vim.keymap.set("n", "<leader>ds", dap.step_over)
    vim.keymap.set("n", "<leader>di", dap.step_into)
    vim.keymap.set("n", "<leader>do", dap.step_out)
    vim.keymap.set("n", "<C-b>", function()
      dap.toggle_breakpoint()
      breakpoints.store()
    end)
    vim.keymap.set("n", "<C-s-b>", function()
      dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
      breakpoints.store()
    end)
    vim.keymap.set("n", "<Leader>dx", function()
      dap.terminate()
      require("xcodebuild.actions").cancel()

      local success, dapui = pcall(require, "dapui")
      if success then
        dapui.close()
      end
    end)
  end,
}
