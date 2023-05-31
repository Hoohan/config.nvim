local status, neogen = pcall(require, "neogen")
if not status then
  vim.notify("do not find neogen.")
  return
end

neogen.setup({
  enabled = true,             --if you want to disable Neogen
  input_after_comment = true, -- (default: true) automatic jump (with insert mode) on inserted annotation
  snippet_engine = "vsnip",
})

--- key mapping ---
local key_map = vim.keymap.set
local generate_function = function()
  neogen.generate({})
end
local generate_class = function()
  neogen.generate({ type = 'class' })
end
local generate_file = function()
  neogen.generate({ type = 'file' })
end
local key_opt = { noremap = true, silent = true }
key_map("n", "<Leader>nf", generate_function, key_opt)
key_map("n", "<Leader>nc", generate_class, key_opt)
key_map("n", "<Leader>nd", generate_file, key_opt)
