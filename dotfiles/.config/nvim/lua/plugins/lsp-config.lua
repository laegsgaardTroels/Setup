-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
-- :help lspconfig-all
return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "ruff", "pyright", "jedi_language_server", "html", "pylsp" },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

            vim.lsp.config(
                "lua_ls", {
                    capabilities = capabilities,
                    settings = { Lua = { diagnostics = { globals = { 'vim' } } } },
                })
            vim.lsp.config("ruff", {
                capabilities = capabilities,
            })
            vim.lsp.config("pyright", {
                capabilities = capabilities,
            })
            vim.lsp.config("jedi_language_server", {
                capabilities = capabilities,
            })
            vim.lsp.config("html", {
                capabilities = capabilities,
            })
            vim.lsp.config("pylsp", {
                capabilities = capabilities,
                root_dir = function(fname)
                    local root_files = {
                        'pyproject.toml',
                        'setup.py',
                        'setup.cfg',
                        'requirements.txt',
                        'Pipfile',
                    }
                    return vim.fs.root(0, root_files)
                end,
                settings = {
                    pylsp = {
                        plugins = {
                            pylint = { enabled = false },
                            flake8 = { enabled = true },
                            pycodestyle = { enabled = false },
                            pyflakes = { enabled = false },
                        }
                    }
                }
            })
        end,
    },
}
