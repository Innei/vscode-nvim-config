return {
    {
        "nvim-treesitter/nvim-treesitter",
        vscode = true,
        opts = function(_, opts)
            -- use wildfire.nvim
            opts.incremental_selection = {
                enable = false,
                keymaps = {
                    init_selection = "<CR>",
                    node_incremental = "<CR>",
                    scope_incremental = "<Tab>",
                    node_decremental = "<BS>"
                }
            }

            opts.context_commentstring = {enable_autocmd = false}

            vim.list_extend(opts.ensure_installed,
                            {"prisma", "dockerfile", "svelte", "swift", "vue"})
        end
    }, {
        "xlboy/swap-ternary.nvim",
        vscode = true,
        keys = {
            {
                "<leader>sX",
                function()
                    require("swap-ternary.controller").swap()
                end,
                desc = "Swap Ternary"
            }
        },
        config = function() end
    }, {
        "sustech-data/wildfire.nvim",
        event = "VeryLazy",
        vscode = true,
        dependencies = {"nvim-treesitter/nvim-treesitter"},
        config = function()
            require("wildfire").setup({
                keymaps = {
                    init_selection = "<CR>",
                    node_incremental = "<CR>",
                    node_decremental = "<BS>"
                }
            })
        end
    }
}
