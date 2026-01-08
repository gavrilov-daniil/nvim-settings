return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("obsidian").setup({
      workspaces = {
        { name = "vault", path = "~/vault" },
      },

      notes_subdir = "notes",

      daily_notes = {
        folder = "daily",
        date_format = "%Y-%m-%d",
        template = "daily.md",
      },

      templates = {
        subdir = "templates",
        date_format = "%Y-%m-%d",
        time_format = "%H:%M",
      },

      attachments = { img_folder = "attachments" },

      preferred_link_style = "wiki",

      note_id_func = function(title)
        local suffix = ""
        if title ~= nil then
          suffix = title:gsub(" ", "-"):gsub("[^%w%-]", ""):lower()
        else
          suffix = tostring(os.time())
        end
        return suffix
      end,

      ui = { enable = true },
    })
  end
}
