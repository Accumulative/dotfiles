local servers = {
  "gopls",
  "jsonls",
  "tsserver",
  "lua_ls",
  "cssls",
  "dockerls",
  "html",
  "pyright",
  "solc",
  "tailwindcss",
  "yamlls",
  "dartls",
  "rust_analyzer",
  "terraformls",
}

function get_python_path(workspace)
  -- Use activated virtualenv.
  if vim.env.VIRTUAL_ENV then
    return path.join(vim.env.VIRTUAL_ENV, "bin", "python")
  end
  -- Find and use virtualenv in workspace directory.
  for _, pattern in ipairs({ "*", ".*" }) do
    local match = vim.fn.glob(path.join(workspace, pattern, "pyvenv.cfg"))
    if match ~= "" then
      return path.join(path.dirname(match), "bin", "python")
    end
  end
  -- Fallback to system Python.
  return vim.fn.exepath("python3") or vim.fn.exepath("python") or "python"
end

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
      ensure_installed = servers,
    })

    local default_capabilities = vim.lsp.protocol.make_client_capabilities()
    local capabilities = require("cmp_nvim_lsp").default_capabilities(default_capabilities)

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

    for _, server in pairs(servers) do
      local opts = {
        on_attach = on_attach,
        capabilities = capabilities,
      }
      local has_custom_opts, server_custom_opts = pcall(require, "plugins.lsp.settings." .. server)
      if has_custom_opts then
        opts = vim.tbl_deep_extend("force", server_custom_opts, opts)
      end
      if server == "pyright" then
        opts.before_init = function(_, config)
          config.settings.python.pythonPath = get_python_path(config.root_dir)
        end
      end
      lspconfig[server].setup(opts)
    end
  end,
}
