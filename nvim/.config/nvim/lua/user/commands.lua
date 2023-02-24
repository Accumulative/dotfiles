local function preview_location_callback(result, ctx)
  if result == nil or vim.tbl_isempty(result) then
    vim.lsp.log.info("No location found")
    return nil
  end
  if vim.tbl_islist(result) then
    vim.lsp.util.preview_location(result[1])
  else
    vim.lsp.util.preview_location(result)
  end
end

function peek_definition()
  local params = vim.lsp.util.make_position_params()
  local result = vim.lsp.buf_request_sync(0, "textDocument/definition", params)
  preview_location_callback(result)
end
