
local status0, mason = pcall(require, "mason")
if not status0 then
    vim.notify("do not find: mason")
    return
end

local status1, mason_config = pcall(require, "mason-lspconfig")
if not status1 then
    vim.notify("do not find: mason-lspconfig")
    return
end

local status2, lspconfig = pcall(require, "lspconfig")
if not status2 then
    vim.notify("do not find: lspconfig")
    return
end

-- :h mason-default-settings
-- ~/.local/share/nvim/mason
mason.setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
})

-- mason-lspconfig uses the `lspconfig` server names in the APIs it exposes - not `mason.nvim` package names
-- https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md
mason_config.setup({
    ensure_installed = {
        "lua_ls",
        "clangd",
    }
})

-- 安装列表
-- { key: 服务器名， value: 配置文件 }
-- key 必须为下列网址列出的 server name，不可以随便写
-- https://github.com/williamboman/nvim-lsp-installer#available-lsps
local servers = {
    lua_ls = require("lsp.config.lua"), -- lua/lsp/config/lua.lua
    clangd = require("lsp.config.clangd"),
}

for name, config in pairs(servers) do
    if config ~= nil and type(config) == "table" then
        -- 自定义初始化配置文件必须实现on_setup 方法
        config.on_setup(lspconfig[name])
    else
        -- 使用默认参数
        lspconfig[name].setup({})
    end
end
