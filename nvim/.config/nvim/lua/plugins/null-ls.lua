-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
return {
  "jose-elias-alvarez/null-ls.nvim",
  config = function()
    null_ls = require("null-ls")
    null_ls.setup({
      debug = true,
      sources = {
        null_ls.builtins.formatting.prettierd.with({
          filetypes = {
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
            "vue",
            "css",
            "scss",
            "less",
            "html",
            "json",
            "jsonc",
            "yaml",
            "markdown",
            "graphql",
            "handlebars",
          },
          env = {
            PRETTIERD_LOCAL_PRETTIER_ONLY = 1,
          },
        }),
        null_ls.builtins.formatting.trim_whitespace.with({
          filetypes = { "plantuml" },
        }), -- null_ls.builtins.formatting.stylua,
        null_ls.builtins.code_actions.eslint_d,
        null_ls.builtins.diagnostics.pylint.with({
          diagnostics_postprocess = function(diagnostic)
            diagnostic.code = diagnostic.message_id
          end,
        }),
        null_ls.builtins.formatting.isort,
        null_ls.builtins.formatting.black,
        null_ls.builtins.diagnostics.eslint_d,
        null_ls.builtins.formatting.eslint_d,
        -- null_ls.builtins.diagnostics.markdownlint,
        -- null_ls.builtins.formatting.shfmt,
        -- null_ls.builtins.diagnostics.shellcheck,
        -- null_ls.builtins.code_actions.shellcheck,
        -- null_ls.builtins.diagnostics.markdownlint,
        null_ls.builtins.code_actions.refactoring, -- null_ls.builtins.formatting.stylua,
        null_ls.builtins.code_actions.gitsigns, -- diagnostics.flake8
      },
    })
  end,
}
