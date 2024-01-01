local opt = vim.opt

-- Show line numbering.
opt.number = true

-- Copy to system clipboard with standard vim commands.
opt.clipboard="unnamed"

-- When there is a previous search pattern, highlight all its matches.
-- E.g. searching and pressing enter will keep the search matches highlighed.
opt.hlsearch = true

-- While typing a search command, show where the pattern, as it was typed.
opt.incsearch = true

-- Set utf8 as standard encoding and en_US as the standard language
opt.encoding = 'utf8'

-- The value of this option influences when the last window will have a
-- status line:
--     0: never
--     1: only if there are at least two windows
--     2: always
--     3: always and ONLY the last window
-- The screen looks nicer with a status line if you have several
-- windows, but it takes another screen line.
opt.laststatus = 2

-- Use spaces instead of tabs
opt.expandtab = true

-- Be smart when using tabs ;)
opt.smarttab = true

-- 1 tab == 4 spaces
-- Source: https://stackoverflow.com/questions/234564/tab-key-4-spaces-and-auto-indent-after-curly-braces-in-vim
opt.shiftwidth = 4
opt.tabstop = 4

-- When on, lines longer than the width of the window will wrap and
-- displaying continues on the next line.  When off lines will not wrap
-- and only part of long lines will be displayed.
opt.wrap = false


-- Ability to scroll with mouse in all modes.
opt.mouse = "a"
