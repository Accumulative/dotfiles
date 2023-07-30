local M = {}

M.mason_tool_installer_ensure_installed = {
  -- LSP
  "bash-language-server",
  "dockerfile-language-server",
  "json-lsp",
  "typescript-language-server",
  "lua-language-server",
  "pyright",
  "terraform-ls",
  "yaml-language-server",
  -- Formatter
  "black",
  "prettier",
  "stylua",
  "shfmt",
  "isort",
  -- Linter
  "eslint_d",
  "prettierd",
  "shellcheck",
  "tflint",
  "yamllint",
  "pylint",
  "markdownlint",
  -- DAP
  "debugpy",
}

M.treesitter_ensure_installed = {
  "bash",
  "html",
  "javascript",
  "json",
  "lua",
  "markdown",
  "markdown_inline",
  "python",
  "query",
  "dockerfile",
  "rust",
  "regex",
  "tsx",
  "diff",
  "typescript",
  "vim",
  "yaml",
  "terraform",
  "sql",
}

M.lsp_servers = {
  "gopls",
  "jsonls",
  "tsserver",
  "clangd",
  "lua_ls",
  "cssls",
  "dockerls",
  "html",
  "pyright",
  "solc",
  "tailwindcss",
  "yamlls",
  "rust_analyzer",
  "terraformls",
}

M.dashboard_ascii = {
  [[  ██ ▄█▀ ██░░  ████  ██▀███   ▄▄▄       ███▄   █ ]],
  [[  ██▄█▒ ▓██░▒▓█   ▀ ██ ▒██  ▒████▄     ██ ▀█   █ ]],
  [[ ▓███▄░ ▒██░▒▒███   ██ ░▄█ ▒▒██  ▀█▄  ▓██  ▀█ ██▒]],
  [[ ▓██ █▄ ░██░▒▓█  ▄ ▒██▀▀█▄  ░██▄▄▄▄██ ▓██▒  ▐▌██▒]],
  [[ ▒██▒ █▄░██░░▒████▒░██▓ ▒██▒ ▓█   ▓██▒▒██░   ▓██░]],
  [[ ▒ ▒▒ ▓▒░▓  ░░ ▒░ ░░ ▒▓ ░▒▓░ ▒▒   ▓▒█░░ ▒░   ▒ ▒ ]],
  [[ ░ ░▒ ▒░ ▒ ░ ░ ░  ░  ░▒ ░ ▒░  ▒   ▒▒ ░░ ░░   ░ ▒░]],
  [[ ░ ░░ ░  ▒ ░   ░     ░░   ░   ░   ▒      ░   ░ ░ ]],
  [[ ░  ░    ░     ░  ░   ░           ░  ░         ░ ]],
}

M.footer_text = "Kieran Burke"
M.diagnostics_on_hover = false
M.signature_on_hover = false
M.focusable_popups = false
M.signature_provider = "cmp" -- cmp/noice
M.diagnostic_display = {
  signs = true,
  underline = false,
  update_in_insert = false,
  virtual_text = {
    spacing = 2,
  },
}

return M
