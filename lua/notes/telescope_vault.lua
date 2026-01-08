local M = {}

local function vault_find()
  require("telescope.builtin").find_files({
    cwd = vim.fn.expand("~/vault"),
    hidden = true,
  })
end

local function vault_grep()
  require("telescope.builtin").live_grep({
    cwd = vim.fn.expand("~/vault"),
  })
end

function M.setup()
  vim.api.nvim_create_user_command("VaultFind", vault_find, {})
  vim.api.nvim_create_user_command("VaultGrep", vault_grep, {})
end

M.setup()
return M
