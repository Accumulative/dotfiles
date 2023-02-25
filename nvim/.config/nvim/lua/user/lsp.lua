local settings = require("user.settings")
local signs = {
  { name = "DiagnosticSignError", text = "" },
  { name = "DiagnosticSignWarn", text = "" },
  { name = "DiagnosticSignHint", text = "" },
  { name = "DiagnosticSignInfo", text = "" },
}

vim.cmd([[highlight DiagnosticError guifg=darkred]])

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

if settings.diagnostics_on_hover == true then
  vim.api.nvim_create_autocmd("CursorHold *", {
    callback = function()
      vim.diagnostic.open_float({ focusable = settings.focusable_popups })
    end,
    nested = true,
  })
end

if settings.diagnostic_display.underline == false then
  vim.cmd([[highlight DiagnosticUnderlineError gui=None]])
  vim.cmd([[highlight DiagnosticUnderlineInfo gui=None]])
  vim.cmd([[highlight DiagnosticUnderlineOk gui=None]])
  vim.cmd([[highlight DiagnosticUnderlineHint gui=None]])
  vim.cmd([[highlight DiagnosticUnderlineWarn gui=None]])
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, settings.diagnostic_display)

if settings.signature_on_hover == true then
  vim.api.nvim_create_autocmd("CursorHold *", {
    callback = function()
      vim.lsp.buf.hover()
    end,
    nested = true,
  })
end
