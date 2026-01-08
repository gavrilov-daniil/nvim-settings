return {
  "ellisonleao/glow.nvim",
  ft = { "markdown" },
  config = function()
    require("glow").setup({
      border = "rounded",
      width = 120, -- можно убрать/изменить
    })
  end,
}
