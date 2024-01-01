local keymap = vim.keymap


-- Remap goto in docs.
keymap.set("n", "<leader>g", "<C-]>")

-- Fast save/exit
keymap.set("", "<leader>w", ":w!<cr>")
keymap.set("", "<leader>q", ":q!<cr>")

-- Move between windows easier
keymap.set("n", "<C-l>", "<C-w>l")
keymap.set("n", "<C-h>", "<C-w>h")
keymap.set("n", "<C-j>", "<C-w>j")
keymap.set("n", "<C-k>", "<C-w>k")
keymap.set("t", "<C-l>", "<C-\\><C-N>C-w>l")
keymap.set("t", "<C-h>", "<C-\\><C-N>C-w>h")
keymap.set("t", "<C-j>", "<C-\\><C-N>C-w>j")
keymap.set("t", "<C-k>", "<C-\\><C-N>C-w>k")

-- NetrwRefresh uses the <C-l> to refresh if it is not already mapped (uses hasmapto(...))
keymap.set("n", "<C-r>", "<Plug>NetrwRefresh")

-- Remove search results
keymap.set("", "<space>", "/")
keymap.set("", "<Esc><Esc>", ":<C-u>nohlsearch<CR>")

-- Select all after cursor in visual mode.
keymap.set("v", "<S-E>", "g_")

-- Fast terminal.
keymap.set('n', '<leader>t', ':Vexplore!<cr>:terminal<cr>i')

-- Fast terminal normal mode.
keymap.set('t', '<C-n>', '<C-\\><C-N>')

-- Fast split.
keymap.set('n', '<leader>e', ':Explore<cr>')
keymap.set('n', '<leader>s', ':Sexplore<cr>')
keymap.set('n', '<leader>v', ':Vexplore!<cr>')
