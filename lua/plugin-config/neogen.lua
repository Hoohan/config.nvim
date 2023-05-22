local status, neogen = pcall(require, "neogen")
if not status then
  vim.notify("do not find neogen.")
  return
end

neogen.setup({
  enabled = true, --if you want to disable Neogen
  input_after_comment = true, -- (default: true) automatic jump (with insert mode) on inserted annotation
  snippet_engine = "vsnip",
})
