return {
  "L3MON4D3/LuaSnip",
  event = "BufEnter",
  dependencies = {
    "saadparwaiz1/cmp_luasnip",
  },
  config = function()
    local ls = require("luasnip")

    ls.config.set_config({ history = true, updateevents = "TextChanged,TextChangedI" })

    -- load friendly-snippets
    require("luasnip.loaders.from_vscode").lazy_load()
  end,
}
