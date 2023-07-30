local settings = require("user.settings")
return {
  "VonHeikemen/lsp-zero.nvim",
  branch = "v1.x",
  dependencies = {
    -- LSP Support
    {
      "neovim/nvim-lspconfig",
      -- opts = {
      --   setup = {
      --     clangd = function(_, opts)
      --       opts.capabilities.offsetEncoding = { "utf-16" }
      --     end,
      --   },
      -- },
    }, -- Required
    { "williamboman/mason.nvim" }, -- Optional
    { "williamboman/mason-lspconfig.nvim" }, -- Optional

    -- Autocompletion
    { "hrsh7th/nvim-cmp" }, -- Required
    { "hrsh7th/cmp-nvim-lsp" }, -- Required
    { "hrsh7th/cmp-buffer" }, -- Optional
    { "hrsh7th/cmp-path" }, -- Optional
    { "saadparwaiz1/cmp_luasnip" }, -- Optional
    { "hrsh7th/cmp-nvim-lua" }, -- Optional

    --[[ -- Signature ]]
    { "https://github.com/ray-x/lsp_signature.nvim" },

    -- Snippets { 'L3MON4D3/LuaSnip' }, -- Required
    { "rafamadriz/friendly-snippets" }, -- Optional
  },
  config = function()
    local lsp = require("lsp-zero")

    lsp.preset({
      name = "recommended",
      set_lsp_keymaps = { preserve_mappings = false },
    })
    local cmp_mapping = lsp.defaults.cmp_mappings()
    cmp_mapping["<Tab>"] = nil
    lsp.setup_nvim_cmp({
      mapping = cmp_mapping,
    })

    local lsp_signature_config = {
      bind = true, -- This is mandatory, otherwise border config won't get registered.
      handler_opts = {
        border = "rounded",
      },
    }

    if settings.signature_provider == "cmp" then
      -- virtual text signature
      require("lsp_signature").setup(lsp_signature_config)
    end

    lsp.ensure_installed(settings.lsp_servers)

    -- (Optional) Configure lua language server for neovim
    lsp.nvim_workspace()

    lsp.setup()

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.offsetEncoding = { "utf-16" }
    require("lspconfig").clangd.setup({
      capabilities = capabilities,
    })
  end,
}
