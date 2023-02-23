local settings = require("user.settings")

return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    {
      "windwp/nvim-autopairs",
      "nvim-treesitter/playground",
      cmd = { "TSPlaygroundToggle", "TSHighlightCapturesUnderCursor" },
      keys = {
        {
          "<F2>",
          "<cmd>TSHighlightCapturesUnderCursor<cr>",
          desc = "Show highlight group under cursor",
        },
      },
    },
    "nvim-treesitter/nvim-treesitter-textobjects",
    "nvim-treesitter/nvim-treesitter-refactor",
  },
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = settings.treesitter_ensure_installed,
      sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
      autopairs = {
        enable = true,
      },
      highlight = {
        enable = true, -- false will disable the whole extension
        disable = { "" }, -- list of language that will be disabled
        additional_vim_regex_highlighting = true,
      },
      indent = {
        enable = true,
        disable = { "yaml" },
      },
      playground = {
        enable = true,
        disable = {},
        updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = false, -- Whether the query persists across vim sessions
        keybindings = {
          toggle_query_editor = "o",
          toggle_hl_groups = "i",
          toggle_injected_languages = "t",
          toggle_anonymous_nodes = "a",
          toggle_language_display = "I",
          focus_language = "f",
          unfocus_language = "F",
          update = "R",
          goto_node = "<cr>",
          show_help = "?",
        },
      },
      context_commentstring = {
        enable = true,
        enable_autocmd = false,
      },
    })
  end,
  build = ":TSUpdate",
}
