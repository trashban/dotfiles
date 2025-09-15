local plugin_path = vim.fn.stdpath("config") .. "/lua/plugins"
local files = vim.fn.globpath(plugin_path, "*.lua", false, true)

for _, file in ipairs(files) do
  local name = vim.fn.fnamemodify(file, ":t:r") -- filename without extension
  if name ~= "init" then -- avoid requiring this file itself
    require("plugins." .. name)
  end
end
