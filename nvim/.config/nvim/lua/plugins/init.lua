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
    build = function()
      vim.fn["mkdp#util#install"]()
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
  --{ "https://github.com/ray-x/lsp_signature.nvim", config = true }
  {
    "rmagatti/auto-session",
    config = function()
      require("auto-session").setup({
        log_level = "error",
        auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/", "~/.dotfiles" },
      })
    end,
  },
}