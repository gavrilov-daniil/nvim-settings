local M = {}

local function toggle_checkbox()
  local row = vim.api.nvim_win_get_cursor(0)[1]
  local line = vim.api.nvim_get_current_line()

  if line:match("%- %[% %]") then
    line = line:gsub("%- %[% %]", "- [x]", 1)
  elseif line:match("%- %[[xX]%]") then
    line = line:gsub("%- %[[xX]%]", "- [ ]", 1)
  else
    line = "- [ ] " .. line
  end

  vim.api.nvim_set_current_line(line)
  vim.api.nvim_win_set_cursor(0, { row, 0 })
end

function M.setup()
  vim.api.nvim_create_user_command("ToggleCheckbox", toggle_checkbox, {})
end

M.setup()
return M
