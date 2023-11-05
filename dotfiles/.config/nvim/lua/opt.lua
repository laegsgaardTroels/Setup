-- Show line numbering.
vim.opt.number = true

-- 1 tab == 4 spaces
-- Source: https://stackoverflow.com/questions/234564/tab-key-4-spaces-and-auto-indent-after-curly-braces-in-vim
vim.opt.shiftwidth=4
vim.opt.tabstop=4

-- Copy to system clipboard with standard vim commands.
vim.opt.clipboard="unnamed"

-- Highlight search results
vim.opt.hlsearch = true

-- Makes search act like search in modern browsers
vim.opt.incsearch = true

-- Set utf8 as standard encoding and en_US as the standard language
vim.opt.encoding = 'utf8'
