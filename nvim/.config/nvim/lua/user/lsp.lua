local signs = {
  { name = "DiagnosticSignError", text = "" },
  { name = "DiagnosticSignWarn", text = "" },
  { name = "DiagnosticSignHint", text = "" },
  { name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

local format_filetypes = "*"

vim.api.nvim_create_autocmd(string.format("BufWritePre %s", format_filetypes), {
  callback = function()
    vim.lsp.buf.format({
      timeout_ms = 1000,
      -- check user config to see if we can format on save
      filter = function(client)
        return client.name
      end,
    })
  end,
  nested = true,
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = "rounded",
})
