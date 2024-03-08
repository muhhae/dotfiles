vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'iamcco/markdown-preview.nvim'
    use 'nvim-pack/nvim-spectre'
    use 'rmagatti/auto-session'
    use 'lewis6991/gitsigns.nvim'
    use 'AlexvZyl/nordic.nvim'
    use({
        "MaximilianLloyd/ascii.nvim",
        requires = {
            "MunifTanjim/nui.nvim"
        }
    })
    use "luckasRanarison/tree-sitter-hyprlang"
    use 'nordtheme/vim'
    use 'karb94/neoscroll.nvim'
    use 'andweeb/presence.nvim'
    use 'nvimdev/dashboard-nvim'
    use 'nanozuki/tabby.nvim'
    use 'ThePrimeagen/vim-be-good'
    use 'wakatime/vim-wakatime'
    use "numToStr/FTerm.nvim"
    use {
        'CopilotC-Nvim/CopilotChat.nvim',
        as = 'CopilotChat',
        run = function()
            vim.defer_fn(function()
                vim.cmd("UpdateRemotePlugins")
                vim.notify("CopilotChat - Updated remote plugins. Please restart Neovim.")
            end, 3000)
        end,
    }
    use "github/copilot.vim"
    use { 'mhartington/formatter.nvim' }
    use {
        'fatih/vim-go',
        run = ':GoUpdateBinaries'
    }
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }
    use {
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup()
        end
    }
    use({
        "Pocco81/auto-save.nvim",
    })
    use {
        'numToStr/Comment.nvim',
        config = function()
        end
    }
    use "lukas-reineke/indent-blankline.nvim"
    use { 'stevearc/dressing.nvim' }
    use {
        "folke/noice.nvim",
        requires = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
    }
    use {
        "folke/which-key.nvim",
    }
    use { "catppuccin/nvim", as = "catppuccin" }
    use {
        'echasnovski/mini.indentscope',
    }
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons' }
    }
    use 'wbthomason/packer.nvim'
    use "folke/tokyonight.nvim"
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use {
        'nvim-treesitter/nvim-treesitter', {
        run = ':TSUpdate'
    }
    }
    use('nvim-treesitter/playground')
    use {
        'theprimeagen/harpoon',
        branch = 'harpoon2',
        requires = { { "nvim-lua/plenary.nvim" } }
    }
    use('mbbill/undotree')
    use('tpope/vim-fugitive')
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            { 'neovim/nvim-lspconfig' },
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'L3MON4D3/LuaSnip' },
        }
    }
    use("neovim/nvim-lspconfig")
    use("williamboman/mason.nvim")
    use("williamboman/mason-lspconfig.nvim")
    use("hrsh7th/nvim-cmp")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")
    use("saadparwaiz1/cmp_luasnip")
    use("hrsh7th/cmp-nvim-lua")
    use("L3MON4D3/LuaSnip")
    use("rafamadriz/friendly-snippets")
    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        requires = {
            "nvim-lua/plenary.nvim",
            -- "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
            {
                's1n7ax/nvim-window-picker',
                version = '2.*',
                config = function()
                    require 'window-picker'.setup({
                        filter_rules = {
                            include_current_win = false,
                            autoselect_one = true,
                            -- filter using buffer options
                            bo = {
                                -- if the file type is one of following, the window will be ignored
                                filetype = { 'neo-tree', "neo-tree-popup", "notify" },
                                -- if the buffer type is one of following, the window will be ignored
                                buftype = { 'terminal', "quickfix" },
                            },
                        },
                    })
                end,
            },
        },
    }
end)
