local wk = require("which-key")

wk.add({
  { "<leader>o", group = "Obsidian" },

  { "<leader>oo", "<cmd>ObsidianOpen<cr>", desc = "Открыть в Obsidian (GUI)" },
  { "<leader>on", "<cmd>ObsidianNew<cr>", desc = "Новая заметка" },
  { "<leader>ot", "<cmd>ObsidianTemplate<cr>", desc = "Вставить шаблон" },
  { "<leader>od", "<cmd>ObsidianToday<cr>", desc = "Daily: сегодня" },
  { "<leader>oy", "<cmd>ObsidianYesterday<cr>", desc = "Daily: вчера" },
  { "<leader>om", "<cmd>ObsidianTomorrow<cr>", desc = "Daily: завтра" },
  { "<leader>ob", "<cmd>ObsidianBacklinks<cr>", desc = "Backlinks" },
  { "<leader>ol", "<cmd>ObsidianLinks<cr>", desc = "Ссылки из заметки" },
  { "<leader>os", "<cmd>ObsidianSearch<cr>", desc = "Поиск по vault" },
  { "<leader>oq", "<cmd>ObsidianQuickSwitch<cr>", desc = "Quick switch" },

  -- note-утилиты (наши команды)
  { "<leader>oc", "<cmd>VaultInbox<cr>", desc = "Capture в inbox" },

  { "<leader>tt", "<cmd>ToggleCheckbox<cr>", desc = "Toggle checkbox" },

  { "<leader>vf", "<cmd>VaultFind<cr>", desc = "Vault: find files" },
  { "<leader>vg", "<cmd>VaultGrep<cr>", desc = "Vault: grep text" },

  -- Telescope общие
  { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Найти файл" },
  { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Поиск текста" },
  { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Буферы" },

  { "<leader>mp", "<cmd>MarkdownPreviewToggle<cr>", desc = "Markdown Preview" },
  { "<leader>mp", "<cmd>Glow<cr>", desc = "Markdown Preview (glow, TUI)" },

})
