local status, null_ls = pcall(require, "null-ls")
if not status then
  vim.notify("Can not find null-ls")
  return
end

local formatting = null_ls.builtins.formatting

null_ls.setup({
  debug = false,
  sources = {
    -- shell
    formatting.shfmt,
    -- Lua
    formatting.stylua,
    -- frontend
    formatting.prettier.with({ -- 只比默认配置少了 markdown
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
        "yaml",
        "graphql",
      },
      prefer_local = "node_modules/.bin",
    }),
    -- clang
    formatting.clang_format,
    -- cmake
    formatting.cmake_format,
  },
})
