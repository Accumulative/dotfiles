local settings = require("user.settings")
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

vim.lsp.handlers["textDocument/hover"] = function(_, result, ctx, config)
  config = config or {}
  config.border = "rounded"
  config.focusable = settings.focusable_popups
  config.focus_id = ctx.method
  if not (result and result.contents) then
    return
  end
  local markdown_lines = vim.lsp.util.convert_input_to_markdown_lines(result.contents)
  markdown_lines = vim.lsp.util.trim_empty_lines(markdown_lines)
  if vim.tbl_isempty(markdown_lines) then
    return
  end
  return vim.lsp.util.open_floating_preview(markdown_lines, "markdown", config)
end

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = "rounded",
  focusable = settings.focusable_popups,
})

if settings.diagnostics_on_hover == true then
  vim.api.nvim_create_autocmd("CursorHold *", {
    callback = function()
      vim.diagnostic.open_float({ focusable = settings.focusable_popups })
    end,
    nested = true,
  })
end

if settings.signature_on_hover == true then
  vim.api.nvim_create_autocmd("CursorHold *", {
    callback = function()
      vim.lsp.buf.hover()
    end,
    nested = true,
  })
end
