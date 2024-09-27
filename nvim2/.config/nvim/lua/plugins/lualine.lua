local hide_in_width = function()
  return vim.fn.winwidth(0) > 80
end

local diagnostics = {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  sections = { "error", "warn" },
  colored = true,
  update_in_insert = false,
  always_visible = true,
}

local filename = {
  "filename",
  file_status = true, -- Displays file status (readonly status, modified status)
  newfile_status = false, -- Display new file status (new file means no write after created)
  -- 0: Just the filename
  -- 1: Relative path
  -- 2: Absolute path
  -- 3: Absolute path, with tilde as the home directory
  path = 1,
  --[[ shorting_target = 40, -- Shortens path to leave 40 spaces in the window ]]

  -- for other components. (terrible name, any suggestions?)
  symbols = {
    modified = "[+]", -- Text to show when the file is modified.
    readonly = "[-]", -- Text to show when the file is non-modifiable or readonly.
    unnamed = "[No Name]", -- Text to show for unnamed buffers.
    newfile = "[New]", -- Text to show for newly created file before first write
  },
}

local mode = {
  "mode",
  fmt = function(str)
    return "-- " .. str .. " --"
  end,
}

local filetype = {
  "filetype",
  icons_enabled = true,
}

local branch = {
  "branch",
  icons_enabled = true,
  icon = "",
}

local location = {
  "location",
  padding = 0,
}

return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    options = {
      icons_enabled = true,
      theme = "tokyonight",
      component_separators = {
        left = "",
        right = "",
      },
      section_separators = {
        left = "",
        right = "",
      },
      disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
      always_divide_middle = true,
    },
    sections = {
      lualine_a = { branch },
      lualine_b = { diagnostics },
      lualine_c = { filename },
      lualine_x = { filetype },
      lualine_z = { mode },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { filename },
      lualine_x = { filetype },
      lualine_y = {},
      lualine_z = {},
    },
    tabline = {},
    extensions = {},
  },
}
