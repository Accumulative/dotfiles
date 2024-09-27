return {
  "rmagatti/auto-session",
  config = function()
    vim.g.auto_session_pre_save_cmds = { "tabdo NERDTreeClose" }
    require("auto-session").setup({
      log_level = "error",
      auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/", "~/.dotfiles" },
      pre_save_cmds = { "tabdo NvimTreeClose" },
      post_restore_cmds = { "tabdo NvimTreeRefresh" },
    })
  end,
}
