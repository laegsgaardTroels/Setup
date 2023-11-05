-- /opt/homebrew/Cellar/neovim/0.9.2/share/nvim/runtime/doc/lua-guide.txt

-- Remap goto in docs.
vim.keymap.set("n", "<leader>g", "<C-]>")

-- Fast save/exit
vim.keymap.set("", "<leader>w", ":w!<cr>")
vim.keymap.set("", "<leader>q", ":q!<cr>")

-- Move between windows easier
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("t", "<C-l>", "<C-\\><C-N>C-w>l")
vim.keymap.set("t", "<C-h>", "<C-\\><C-N>C-w>h")
vim.keymap.set("t", "<C-j>", "<C-\\><C-N>C-w>j")
vim.keymap.set("t", "<C-k>", "<C-\\><C-N>C-w>k")

-- Remove search results
vim.keymap.set("", "<space>", "/")
vim.keymap.set("", "<Esc><Esc>", ":<C-u>nohlsearch<CR>")

-- Select all after cursor in visual mode.
vim.keymap.set("v", "<S-E>", "g_")

-- Fast terminal.
vim.keymap.set('n', '<leader>t', ':Vexplore!<cr>:terminal<cr>i')

-- Fast terminal normal mode.
vim.keymap.set('t', '<C-n>', '<C-\\><C-N>')

-- Fast split.
vim.keymap.set('n', '<leader>e', ':Explore<cr>')
vim.keymap.set('n', '<leader>s', ':Sexplore<cr>')
vim.keymap.set('n', '<leader>v', ':Vexplore!<cr>')
