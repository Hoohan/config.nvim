vim.opt.termguicolors = true

local dashboard_header = "Coding Changes the World."
dashboard_header = vim.split(string.rep("\n", 8) .. dashboard_header .. "\n\n", "\n")

return {

    {
        'akinsho/bufferline.nvim',
        version = "*",
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function()
            require("bufferline").setup {}
        end,
    },

    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("nvim-tree").setup {}
        end,
    },

    {
        'nvim-lualine/lualine.nvim',
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function()
            require('lualine').setup {
                options = {
                    icons_enabled = true,
                    theme = 'auto',
                    component_separators = { left = '', right = '' },
                    section_separators = { left = '', right = '' },
                    disabled_filetypes = {
                        statusline = {},
                        winbar = {},
                    },
                    ignore_focus = {},
                    always_divide_middle = true,
                    globalstatus = false,
                    refresh = {
                        statusline = 1000,
                        tabline = 1000,
                        winbar = 1000,
                    }
                },
                sections = {
                    lualine_a = { 'mode' },
                    lualine_b = { 'branch', 'diff', 'diagnostics' },
                    lualine_c = { 'filename' },
                    lualine_x = {
                        'encoding',
                        {
                            'fileformat',
                            symbols = {
                                unix = ' LF', -- e712
                                dos = ' CRLF', -- e70f
                                mac = ' CR', -- e711
                            }
                        }, 'filetype' },
                    lualine_y = { 'progress' },
                    lualine_z = { 'location' }
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = { 'filename' },
                    lualine_x = { 'location' },
                    lualine_y = {},
                    lualine_z = {}
                },
                tabline = {},
                winbar = {},
                inactive_winbar = {},
                extensions = {}
            }
        end,
    },

    {
        'nvimdev/dashboard-nvim',
        event = 'VimEnter',
        config = function()
            require('dashboard').setup {
                theme = 'doom',
                config = {
                    header = dashboard_header,
                    center = {
                        { action = 'lua LazyVim.pick()()', desc = " Find File", icon = " ", key = "f" },
                        { action = "ene | startinsert", desc = " New File", icon = " ", key = "n" },
                        { action = 'lua LazyVim.pick("oldfiles")()', desc = " Recent Files", icon = " ", key = "r" },
                        { action = 'lua LazyVim.pick("live_grep")()', desc = " Find Text", icon = " ", key = "g" },
                        { action = 'lua LazyVim.pick.config_files()()', desc = " Config", icon = " ", key = "c" },
                        { action = 'lua require("persistence").load()', desc = " Restore Session", icon = " ", key = "s" },
                        { action = "LazyExtras", desc = " Lazy Extras", icon = " ", key = "x" },
                        { action = "Lazy", desc = " Lazy", icon = "󰒲 ", key = "l" },
                        { action = function() vim.api.nvim_input("<cmd>qa<cr>") end, desc = " Quit", icon = " ", key = "q" },
                    },
                    footer = function()
                        local stats = require("lazy").stats()
                        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
                        return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
                    end,
                }
            }
        end,
        dependencies = { { 'nvim-tree/nvim-web-devicons' } }
    }
}
