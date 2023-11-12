return {
  "rcarriga/nvim-dap-ui",
  dependencies = {
    "mfussenegger/nvim-dap",
  },
  config = function()
    require("dapui").setup({
      controls = {
        element = "repl",
        enabled = true,
        icons = {
          run_last = "󰑙",
          disconnect = "",
          terminate = "",
          pause = "󰏤",
          play = "",
          step_into = "󰆹",
          step_out = "󰆸",
          step_over = "󰆷",
          step_back = "󰓕",
        },
      },
      element_mappings = {},
      expand_lines = true,
      floating = {
        border = "single",
        mappings = {
          close = { "q", "<Esc>" },
        },
      },
      force_buffers = true,
      icons = {
        collapsed = "",
        expanded = "",
        current_frame = "",
      },
      layouts = {
        {
          elements = {
            {
              id = "stacks",
              size = 0.25,
            },
            {
              id = "scopes",
              size = 0.25,
            },
            {
              id = "breakpoints",
              size = 0.25,
            },
            {
              id = "watches",
              size = 0.25,
            },
          },
          position = "left",
          size = 60,
        },
        {
          elements = {
            {
              id = "repl",
              size = 1.0,
            },
            -- {
            -- 	id = "console",
            -- 	size = 0.5,
            -- },
          },
          position = "bottom",
          size = 10,
        },
      },
      mappings = {
        edit = "e",
        expand = { "<CR>", "<2-LeftMouse>" },
        open = "o",
        remove = "d",
        repl = "r",
        toggle = "t",
      },
      render = {
        indent = 1,
        max_value_lines = 100,
      },
    })

    local dap, dapui = require("dap"), require("dapui")

    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end
  end,
}
