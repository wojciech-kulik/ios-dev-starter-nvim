local M = {}

local function file_exist(file_path)
  local f = io.open(file_path, "r")
  return f ~= nil and io.close(f)
end

function M.store()
  local breakpoints = require("dap.breakpoints")
  local settings = vim.fn.getcwd() .. "/.nvim"
  local breakpoints_fp = settings .. "/breakpoints.json"
  vim.fn.systemlist({ "mkdir", "-p", settings })

  local bps = {}

  if file_exist(breakpoints_fp) then
    local breakpoints_handle = io.open(breakpoints_fp)

    if breakpoints_handle then
      local load_bps_raw = breakpoints_handle:read("*a")
      breakpoints_handle:close()

      if string.len(load_bps_raw) > 0 then
        bps = vim.fn.json_decode(load_bps_raw)
      end
    end
  end

  local breakpoints_by_buf = breakpoints.get()
  for _, bufrn in ipairs(vim.api.nvim_list_bufs()) do
    bps[vim.api.nvim_buf_get_name(bufrn)] = breakpoints_by_buf[bufrn]
  end

  local fp = io.open(breakpoints_fp, "w")
  if fp then
    fp:write(vim.fn.json_encode(bps))
    fp:close()
  end
end

function M.load()
  local breakpoints = require("dap.breakpoints")
  local settings = vim.fn.getcwd() .. "/.nvim"

  local fp = io.open(settings .. "/breakpoints.json", "r")
  if not fp then
    return
  end

  local content = fp:read("*a")
  fp:close()

  if string.len(content) == 0 then
    return
  end

  local bps = vim.fn.json_decode(content)

  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    local file_name = vim.api.nvim_buf_get_name(buf)

    if bps[file_name] then
      for _, bp in pairs(bps[file_name]) do
        local opts = {
          condition = bp.condition,
          log_message = bp.logMessage,
          hit_condition = bp.hitCondition,
        }
        breakpoints.set(opts, tonumber(buf), bp.line)
      end
    end
  end
end

return M
