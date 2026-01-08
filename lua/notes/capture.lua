local M = {}

local function ensure_dir(path)
  local ok = vim.uv.fs_stat(path)
  if not ok then vim.fn.mkdir(path, "p") end
end

local function capture_inbox()
  local vault = vim.fn.expand("~/vault")
  local inbox_dir = vault .. "/inbox"
  ensure_dir(inbox_dir)

  local ts = os.date("%Y-%m-%d_%H%M")
  vim.ui.input({ prompt = "Inbox title (optional): " }, function(title)
    if title == nil then return end
    title = title:gsub("^%s+", ""):gsub("%s+$", "")

    local slug = title ~= "" and title or ts
    slug = slug:gsub(" ", "-"):gsub("[^%w%-_]", ""):lower()

    local filename = string.format("%s/%s.md", inbox_dir, ts .. "_" .. slug)
    vim.cmd("edit " .. vim.fn.fnameescape(filename))

    if vim.fn.line("$") == 1 and vim.fn.getline(1) == "" then
      local lines = {
        "---",
        'title: "' .. (title ~= "" and title:gsub('"', '\\"') or slug) .. '"',
        "created: " .. os.date("%Y-%m-%d %H:%M"),
        "tags: [inbox]",
        "---",
        "",
        "# " .. (title ~= "" and title or "Inbox " .. ts),
        "",
        "- ",
        "",
      }
      vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
      vim.cmd("normal! gg")
    end
  end)
end

function M.setup()
  vim.api.nvim_create_user_command("VaultInbox", capture_inbox, {})
end

M.setup()
return M
