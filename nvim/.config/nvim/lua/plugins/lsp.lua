local settings = require("user.settings")

return {
  dependencies = {
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp",
    "onsails/lspkind-nvim",
    {
      "folke/neodev.nvim",
      opts = {
        library = { plugins = { "nvim-dap-ui" }, types = true },
      },
    },
  },
  "williamboman/nvim-lsp-installer",
  config = function()
    local lspconfig = require("lspconfig")
    local lsp_installer = require("nvim-lsp-installer")

    lsp_installer.setup({
      ensure_installed = settings.lsp_servers,
    })

    local function lsp_highlight_document(client)
      -- Set autocommands conditional on server_capabilities
      local status_ok, illuminate = pcall(require, "illuminate")
      if not status_ok then
        return
      end
      illuminate.on_attach(client)
      -- end
    end

    local on_attach = function(client, bufnr)
      -- vim.notify(client.name .. " starting...")
      -- TODO: refactor this into a method that checks if string in list
      if client.name == "tsserver" then
        client.server_capabilities.document_formatting = false
      end
      lsp_highlight_document(client)
    end

    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    for _, server in pairs(settings.lsp_servers) do
      local opts = {
        on_attach = on_attach,
        capabilities = capabilities,
      }
      local has_custom_opts, server_custom_opts = pcall(require, "plugins.lsp.settings." .. server)
      if has_custom_opts then
        opts = vim.tbl_deep_extend("force", server_custom_opts, opts)
      end
      lspconfig[server].setup(opts)
    end
  end,
}
