local M = {}

local vault_root = vim.fn.expand("~/vault") .. "/"

local function is_in_vault(bufnr)
  local path = vim.api.nvim_buf_get_name(bufnr)
  return path:sub(1, #vault_root) == vault_root and path:sub(-3) == ".md"
end

local function has_frontmatter(bufnr)
  local l1 = (vim.api.nvim_buf_get_lines(bufnr, 0, 1, false)[1] or "")
  return l1:match("^%-%-%-$") ~= nil
end

local function insert_frontmatter_if_empty(bufnr)
  if not is_in_vault(bufnr) then return end
  if has_frontmatter(bufnr) then return end

  local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
  local empty = (#lines == 0) or (#lines == 1 and lines[1] == "")
  if not empty then return end

  local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(bufnr), ":t:r")
  local title = filename:gsub("%-", " ")

  local fm = {
    "---",
    'title: "' .. title:gsub('"', '\\"') .. '"',
    "created: " .. os.date("%Y-%m-%d %H:%M"),
    "tags: []",
    "aliases: []",
    "---",
    "",
    "# " .. title,
    "",
  }

  vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, fm)
  vim.cmd("normal! gg")
end

function M.setup()
  vim.api.nvim_create_autocmd({ "BufNewFile" }, {
    pattern = { vault_root .. "**/*.md" },
    callback = function(args) insert_frontmatter_if_empty(args.buf) end,
  })
end

M.setup()
return M
