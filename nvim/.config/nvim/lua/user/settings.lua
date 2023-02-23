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
  -- Linter
  "eslint_d",
  "prettierd",
  "shellcheck",
  "tflint",
  "yamllint",
  -- DAP
  "debugpy",
}

M.treesitter_ensure_installed = {
  "bash",
  "help",
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

return M
