vim.g.mapleader = ','

local keymap = vim.keymap
local option = vim.opt


--------------------------------- Keymaps -----------------------------------


-- Remap goto in docs.
keymap.set("n", "<leader>g", "<C-]>")

-- Fast save/exit
keymap.set({"i", "n"}, "<leader>w", ":w!<cr>")
keymap.set({"i", "n"}, "<leader>q", ":q!<cr>")
keymap.set({"t"}, "<leader>q", "<C-\\><C-n>:q!<cr>")

-- Move between windows easier
keymap.set("n", "<C-l>", "<C-w>l")
keymap.set("n", "<C-h>", "<C-w>h")
keymap.set("n", "<C-j>", "<C-w>j")
keymap.set("n", "<C-k>", "<C-w>k")
keymap.set("t", "<C-l>", "<C-\\><C-N><C-w>l")
keymap.set("t", "<C-h>", "<C-\\><C-N><C-w>h")
keymap.set("t", "<C-j>", "<C-\\><C-N><C-w>j")
keymap.set("t", "<C-k>", "<C-\\><C-N><C-w>k")

-- Normal mode in terminal mode
keymap.set("t", "<C-k>", "<C-\\><C-n>")

-- NetrwRefresh uses the <C-l> to refresh if it is not already mapped (uses hasmapto(...))
-- keymap.set("n", "<C-r>", "<Plug>NetrwRefresh")

-- Remove search results.
keymap.set("", "<space>", "/")
keymap.set("", "<Esc>", ":<C-u>nohlsearch<CR>")

-- Select all after cursor in visual mode.
keymap.set("v", "<S-E>", "g_")

-- Fast terminal.
keymap.set('n', '<leader>t', ':Vexplore!<cr>:terminal<cr>i')

-- Fast terminal normal mode.
keymap.set('t', '<leader>n', '<C-\\><C-N>')

-- Fast split.
keymap.set('n', '<leader>e', ':Explore<cr>')
keymap.set('n', '<leader>s', ':Sexplore<cr>')
keymap.set('n', '<leader>v', ':Vexplore!<cr>')

-- Goto definition.
keymap.set("n", "<leader>g", vim.lsp.buf.definition)

-- Fast format.
keymap.set('n', 'ff', function()
    vim.lsp.buf.format { async = true }
end)

-- View git tree.
keymap.set('n', '<leader>c', ':GV<CR>')


----------------------------------- Options -----------------------------------


-- Show line numbering.
option.number = true

-- Copy to system clipboard with standard vim commands.
option.clipboard = "unnamed"

-- When there is a previous search pattern, highlight all its matches.
-- E.g. searching and pressing enter will keep the search matches highlighed.
option.hlsearch = true

-- While typing a search command, show where the pattern, as it was typed.
option.incsearch = true

-- Set utf8 as standard encoding and en_US as the standard language
option.encoding = 'utf8'

-- The value of this option influences when the last window will have a
-- status line:
--     0: never
--     1: only if there are at least two windows
--     2: always
--     3: always and ONLY the last window
-- The screen looks nicer with a status line if you have several
-- windows, but it takes another screen line.
option.laststatus = 2

-- Use spaces instead of tabs
option.expandtab = true

-- Be smart when using tabs ;)
option.smarttab = true

-- 1 tab == 4 spaces
-- Source: https://stackoverflow.com/questions/234564/tab-key-4-spaces-and-auto-indent-after-curly-braces-in-vim
option.shiftwidth = 4
option.tabstop = 4

-- When on, lines longer than the width of the window will wrap and
-- displaying continues on the next line.  When off lines will not wrap
-- and only part of long lines will be displayed.
option.wrap = false

-- Ability to scroll with mouse in all modes.
option.mouse = "a"
