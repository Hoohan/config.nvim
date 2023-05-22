-- basic config
require("basic-config")

-- Plugin Manager: Packer
require("plugins")

-- keybinding
require("keybindings")

-- Color Scheme
require("colorscheme")

-- ui plugins
require("plugin-config.nvim-tree")
require("plugin-config.bufferline")
require("plugin-config.lualine")
require("plugin-config.indent-blankline")
require("plugin-config.nvim-treesitter")

-- tool plugins
require("plugin-config.telescope")
require("plugin-config.nvim-autopairs")
require("plugin-config.comment-nvim")
require("plugin-config.neogen")

-- lsp
require("lsp.setup")
require("lsp.cmp")
require("lsp.null-ls")
require("lsp.ui")
