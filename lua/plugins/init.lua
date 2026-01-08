local plugins = {
  { "folke/tokyonight.nvim", priority = 1000, config = function()
      vim.cmd.colorscheme("tokyonight")
    end
  },

  { "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({ options = { section_separators = "", component_separators = "" } })
    end
  },

  { "folke/which-key.nvim", config = function() require("which-key").setup() end },

  { "nvim-lua/plenary.nvim" },

  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({
        defaults = { file_ignore_patterns = { "%.git/", "node_modules/" } }
      })
    end
  },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ensure_installed = {
        "lua",
        "markdown",
        "markdown_inline",
      },
      highlight = {
        enable = true,
      },
    },
  },


  { "lewis6991/gitsigns.nvim", config = function() require("gitsigns").setup() end },

  { "hrsh7th/nvim-cmp", dependencies = { "hrsh7th/cmp-buffer", "hrsh7th/cmp-path", "L3MON4D3/LuaSnip" },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        snippet = { expand = function(args) require("luasnip").lsp_expand(args.body) end },
        mapping = cmp.mapping.preset.insert({
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping.select_next_item(),
          ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        }),
        sources = cmp.config.sources({ { name = "path" }, { name = "buffer" } }),
      })
    end
  },

  require("plugins.glow"),
  require("plugins.luasnip"),

  -- obsidian.nvim вынесен отдельно
  require("plugins.obsidian"),


}

require("lazy").setup(plugins)

