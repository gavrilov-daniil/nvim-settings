return {
  "L3MON4D3/LuaSnip",
  event = "InsertEnter",
  config = function()
    local ls = require("luasnip")

    ls.config.set_config({
      history = true,
      updateevents = "TextChanged,TextChangedI",
      enable_autosnippets = false,
    })

    -- ВАЖНО: грузим твои сниппеты ПОСЛЕ загрузки LuaSnip
    require("snippets.markdown")
  end,
}
