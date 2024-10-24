-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
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
                ensure_installed = { "lua_ls", "ruff_lsp", "pyright", "jedi_language_server", "html", "pylsp" },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
            local lspconfig = require("lspconfig")

            lspconfig.lua_ls.setup({
                capabilities = capabilities,
                settings = { Lua = { diagnostics = { globals = { 'vim' } } } },
            })
            lspconfig.ruff_lsp.setup({
                capabilities = capabilities,
            })
            lspconfig.pyright.setup({
                capabilities = capabilities,
            })
            lspconfig.jedi_language_server.setup({
                capabilities = capabilities,
            })
            lspconfig.html.setup({
                capabilities = capabilities,
            })
            lspconfig.pylsp.setup({
                capabilities = capabilities,
                root_dir = function(fname)
                    local root_files = {
                        'pyproject.toml',
                        'setup.py',
                        'setup.cfg',
                        'requirements.txt',
                        'Pipfile',
                    }
                    unpack = table.unpack or unpack -- 5.1 compatibility
                    return lspconfig.util.root_pattern(unpack(root_files))(fname)
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
