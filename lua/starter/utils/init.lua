local M = {}

local cachedConfig = {}
local searchedForConfig = {}

function M.find_config(filename)
  if searchedForConfig[filename] then
    return cachedConfig[filename]
  end

  local configs = vim.fn.systemlist({
    "find",
    vim.fn.getcwd(),
    "-maxdepth",
    "2",
    "-iname",
    filename,
    "-not",
    "-path",
    "*/.*/*",
  })
  searchedForConfig[filename] = true

  if vim.v.shell_error ~= 0 then
    return nil
  end

  table.sort(configs, function(a, b)
    return a ~= "" and #a < #b
  end)

  if configs[1] then
    cachedConfig[filename] = string.match(configs[1], "^%s*(.-)%s*$")
  end

  return cachedConfig[filename]
end

return M
