return {
  "kyazdani42/nvim-tree.lua",
  dependencies = { "nvim-telescope/telescope.nvim" },
  opts = {
    -- needs to be disabled for GBrowse to work
    -- alternative: could create own :Browse function?
    disable_netrw = false,
    hijack_netrw = false,
    hijack_cursor = false,
    update_cwd = true,
    diagnostics = {
      enable = true,
      icons = {
        hint = "",
        info = "",
        warning = "",
        error = "",
      },
    },
    update_focused_file = {
      enable = true,
      update_cwd = true,
      ignore_list = {},
    },
    system_open = {
      cmd = nil,
      args = {},
    },
    filters = {
      dotfiles = false,
      custom = {},
    },
    git = {
      enable = true,
      ignore = true,
      timeout = 500,
    },
    view = {
      width = 30,
      hide_root_folder = false,
      side = "left",
      number = false,
      relativenumber = false,
    },
    trash = {
      cmd = "trash",
      require_confirm = true,
    },
    actions = {
      open_file = {
        quit_on_open = true,
        window_picker = {
          enable = false,
        },
      },
    },
    renderer = {
      icons = {
        glyphs = {
          default = "",
          symlink = "",
          git = {
            unstaged = "",
            staged = "S",
            unmerged = "",
            renamed = "➜",
            deleted = "",
            untracked = "U",
            ignored = "◌",
          },
          folder = {
            default = "",
            open = "",
            empty = "",
            empty_open = "",
            symlink = "",
          },
        },
      },
    },
    --  unknown options as of 22.05
    --
    --  update_to_buf_dir = {
    --    enable = true,
    --    auto_open = true,
    --  },
    --  auto_resize = true,
    --  git_hl = 1,
    --  root_folder_modifier = ":t",
  },
}
