local function setupListeners()
  local dap = require("dap")
  local areSet = false

  dap.listeners.after["event_initialized"]["me"] = function()
    if not areSet then
      areSet = true
      vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Continue", noremap = true })
      vim.keymap.set("n", "<leader>dC", dap.run_to_cursor, { desc = "Run To Cursor" })
      vim.keymap.set("n", "<leader>ds", dap.step_over, { desc = "Step Over" })
      vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "Step Into" })
      vim.keymap.set("n", "<leader>do", dap.step_out, { desc = "Step Out" })
      vim.keymap.set({ "n", "v" }, "<Leader>dh", require("dap.ui.widgets").hover, { desc = "Hover" })
      vim.keymap.set({ "n", "v" }, "<Leader>de", require("dapui").eval, { desc = "Eval" })
    end
  end

  dap.listeners.after["event_terminated"]["me"] = function()
    if areSet then
      areSet = false
      vim.keymap.del("n", "<leader>dc")
      vim.keymap.del("n", "<leader>dC")
      vim.keymap.del("n", "<leader>ds")
      vim.keymap.del("n", "<leader>di")
      vim.keymap.del("n", "<leader>do")
      vim.keymap.del({ "n", "v" }, "<Leader>dh")
      vim.keymap.del({ "n", "v" }, "<Leader>de")
    end
  end
end

return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "wojciech-kulik/xcodebuild.nvim",
  },
  config = function()
    local dap = require("dap")
    local xcodebuild = require("xcodebuild.integrations.dap")
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
    local define = vim.fn.sign_define
    define("DapBreakpoint", { text = "", texthl = "DiagnosticError", linehl = "", numhl = "" })
    define("DapBreakpointRejected", { text = "", texthl = "DiagnosticError", linehl = "", numhl = "" })
    define("DapStopped", { text = "", texthl = "DiagnosticOk", linehl = "", numhl = "" })
    define("DapLogPoint", { text = "", texthl = "DiagnosticInfo", linehl = "", numhl = "" })
    define("DapLogPoint", { text = "", texthl = "DiagnosticInfo", linehl = "", numhl = "" })

    -- disables annoying warning that requires hitting enter
    local orig_notify = require("dap.utils").notify
    require("dap.utils").notify = function(msg, log_level)
      if not string.find(msg, "Either the adapter is slow") then
        orig_notify(msg, log_level)
      end
    end

    -- integration with xcodebuild.nvim
    setupListeners()

    vim.keymap.set("n", "<leader>dd", xcodebuild.build_and_debug, { desc = "Build & Debug" })
    vim.keymap.set("n", "<leader>dr", xcodebuild.debug_without_build, { desc = "Debug Without Building" })
    vim.keymap.set("n", "<leader>dt", xcodebuild.debug_tests, { desc = "Debug Tests" })
    vim.keymap.set("n", "<leader>b", function()
      dap.toggle_breakpoint()
      breakpoints.store()
    end, { desc = "Toggle Breakpoint" })
    vim.keymap.set("n", "<leader>B", function()
      dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
      breakpoints.store()
    end, { desc = "Toggle Log Breakpoint" })
    vim.keymap.set("n", "<Leader>dx", function()
      if dap.session() then
        dap.terminate()
      end
      require("xcodebuild.actions").cancel()
      dap.listeners.after["event_terminated"]["me"]()

      local success, dapui = pcall(require, "dapui")
      if success then
        dapui.close()
      end
    end, { desc = "Terminate" })
  end,
}
