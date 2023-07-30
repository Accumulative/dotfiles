return {
  "lukas-reineke/indent-blankline.nvim",
  event = "BufEnter",
  config = function()
    vim.cmd([[highlight IndentBlanklineIndent1 guibg=#1a1b26 gui=nocombine]])
    vim.cmd([[highlight IndentBlanklineIndent2 guibg=#1e1f2e gui=nocombine]])
    vim.opt.list = true
    require("indent_blankline").setup({
      space_char_blankline = " ",
      show_current_context = true,
      show_current_context_start = true,
      char = "",
      char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
      },
      space_char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
      },
      show_trailing_blankline_indent = false,
    })
  end,
}
