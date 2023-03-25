return {
  "nvim-lua/plenary.nvim", -- Useful lua functions used ny lots of plugins
  "nvim-tree/nvim-web-devicons",
  "moll/vim-bbye",
  {
    "junegunn/goyo.vim",
    config = function()
      vim.g.goyo_linenr = 1
    end,
  },
  "christoomey/vim-tmux-navigator",
  {
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    build = ":call mkdp#util#install()",
    lazy = true,
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        panel = {
          auto_refresh = false,
          keymap = {
            accept = "<CR>",
            jump_prev = "[[",
            jump_next = "]]",
            refresh = "gr",
            open = "<M-CR>",
          },
        },
        suggestion = {
          auto_trigger = true,
          keymap = {
            accept = "<C-J>",
            prev = "<M-[>",
            next = "<M-]>",
            dismiss = "<C-]>",
          },
        },
      })
    end,
  },
  -- Colorschemes
  -- "lunarvim/colorschemes", -- A bunch of colorschemes you can try out
  {
    "lunarvim/darkplus.nvim",
    lazy = true,
  },
  {
    "ellisonleao/gruvbox.nvim",
    lazy = true,
  },
  {
    "luisiacc/gruvbox-baby",
    lazy = true,
  },
  {
    "navarasu/onedark.nvim",
    lazy = true,
  },
  {
    "EdenEast/nightfox.nvim",
    lazy = true,
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = true,
  },
  {
    "tomasiser/vim-code-dark",
    config = function()
      vim.cmd([[
        set background=dark
        colorscheme codedark
      ]])
    end,
  },
  {
    "xiyaowong/transparent.nvim",
    config = {
      enable = false,
    },
  },
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
  }, -- LSP
  "rafamadriz/friendly-snippets",
  "tamago324/nlsp-settings.nvim", -- language server settings defined in json for
  "JoosepAlviste/nvim-ts-context-commentstring", -- Git
  "tpope/vim-fugitive", -- git utils
  {
    "tpope/vim-dispatch",
    config = function()
      vim.g["dispatch_tmux_height"] = "50% -h"
    end,
  },
  "tpope/vim-surround", -- surround {}
  "tpope/vim-rhubarb", -- :GBrowse
  "tpope/vim-repeat", -- make . stronger
  "tpope/vim-abolish", -- better searching
  "godlygeek/tabular", -- helps align stuff
  "mbbill/undotree",
  {
    "vim-test/vim-test",
    config = function()
      vim.g["test#strategy"] = "dispatch"
      vim.g["test#echo_command"] = 0
    end,
  },
  {
    "wellle/context.vim",
    config = function()
      vim.g.context_add_mappings = 0
    end,
  },
  {
    "windwp/nvim-projectconfig",
    opts = {
      autocmd = true,
    },
  },
  "simrat39/symbols-outline.nvim",
  "unblevable/quick-scope",
  "ThePrimeagen/refactoring.nvim",
  "tpope/vim-dadbod",
  "kristijanhusak/vim-dadbod-ui",
  "puremourning/vimspector",
}
