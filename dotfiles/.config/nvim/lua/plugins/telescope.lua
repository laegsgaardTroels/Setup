return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
            vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
            vim.keymap.set("n", "<leader>fo", builtin.oldfiles, {})
            vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
            vim.keymap.set("n", "<leader>fgc", builtin.git_commits, {})
            vim.keymap.set("n", "<leader>fgb", builtin.git_branches, {})
            vim.keymap.set("n", "<leader>fgs", builtin.git_stash, {})
        end,
    },
    {
        "nvim-telescope/telescope-project.nvim",
        config = function()
            require('telescope').load_extension('project')
            vim.keymap.set(
                'n',
                '<C-p>',
                function()
                    require('telescope').extensions.project.project({
                        base_dirs = {"~/Git"}
                    })
                end,
                { noremap = true, silent = true }
            )
        end,
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({}),
                    },
                },
            })

            require("telescope").load_extension("ui-select")
        end,
    },
}
