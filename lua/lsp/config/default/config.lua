-- M: common LSP config
local M = {}

M.keyAttach = function(bufnr)
  local key_opt = { noremap = true, silent = true, buffer = bufnr }
  local key_map = vim.keymap.set
  -- rename
  key_map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", key_opt)
  -- code action
  key_map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", key_opt)
  -- format
  key_map("n", "<leader>f", "<cmd>lua vim.lsp.buf.format { auync = true } <CR>", key_opt)
  -- go
  key_map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", key_opt)
  key_map("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", key_opt)
  key_map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", key_opt)
  key_map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", key_opt)
  key_map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", key_opt)
  -- diagnostic
  key_map("n", "gp", "<cmd>lua vim.diagnostic.open_float()<CR>", key_opt)
  key_map("n", "gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", key_opt)
  key_map("n", "gj", "<cmd>lua vim.diagnostic.goto_next()<CR>", key_opt)
  -- [unused]
  -- key_map('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', key_opt)
  -- key_map("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", key_opt)
  -- key_map('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', key_opt)
  -- key_map('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', key_opt)
  -- key_map('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', key_opt)
  -- key_map('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', key_opt)
end

--disable format(give it to other plugins)
M.disableFormat = function(client)
  if vim.fn.has("nvim-0.8") == 1 then
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  else
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
  end
end

M.capabilities = require("cmp_nvim_lsp").default_capabilities()
M.capabilities.offsetEncoding = "utf-8"

M.flags = {
  debounce_text_changes = 150,
}

return M
