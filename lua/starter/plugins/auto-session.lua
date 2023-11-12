return {
  "rmagatti/auto-session",
  config = function()
    local auto_session = require("auto-session")

    auto_session.setup({
      auto_restore_enabled = true,
      auto_session_suppress_dirs = { "~/Downloads", "~/Documents", "~/Desktop" },
      auto_save_enabled = true,
    })
  end,
}
