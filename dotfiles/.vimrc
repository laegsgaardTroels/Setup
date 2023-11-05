"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ---- NOT USED ANYMORE, I SWITCHED TO NEOVIM -----------------
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Developer Guide:
"
" To help debug key bindings use :verbose e.g.:
" :verbose nnoremap <C-l>
"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Packages
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Plugins will be downloaded under the specified directory.
" Run :PlugInstall to install.
call plug#begin('~/.vim/plugged')

"Autocompletion
Plug 'davidhalter/jedi-vim'

"Git wrapper
Plug 'tpope/vim-fugitive'

"Git commit browser
Plug 'junegunn/gv.vim'

"Linting
Plug 'w0rp/ale'

"Statusline
Plug 'itchyny/lightline.vim'

"Fuzzy file finder
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

"Find virtualenv
Plug 'jmcantrell/vim-virtualenv'

"<Tab> for insert completion
Plug 'ervandew/supertab'

Plug 'Vimjas/vim-python-pep8-indent'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Basics
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use English spelling. Use :set spell in a document to see spelling
" and ]s [s to go back and forth. And z= for suggestions.
set spelllang=en

" Ability to scroll with mouse in all modes.
set mouse=a

" Split below instead of above.
set splitbelow

filetype plugin on
syntax enable
filetype plugin indent on

" Disable code folding.
set nofoldenable

" Disable wrapping of many lines.
set formatoptions-=t

" Disable wrapping of long lines.
set nowrap

" Show line numbering.
set number

" Set backspace to standard use
" source: https://vi.stackexchange.com/questions/2162/why-doesnt-the-backspace-key-work-in-insert-mode
set backspace=eol,start
set whichwrap+=<,>,h,l

" Assign leader
let mapleader = ","

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Turn backup off, since most stuff is in git anyway...
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
" Source: https://stackoverflow.com/questions/234564/tab-key-4-spaces-and-auto-indent-after-curly-braces-in-vim
set shiftwidth=4
set tabstop=4

" Line break on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Copy to system clipboard with standard vim commands.
if has("xterm_clipboard")
    set clipboard=unnamedplus
elseif has("clipboard")
    set clipboard=unnamed
else
    echo "+xterm_clipboard is not a feature, see `vim --version`."
    echo "Install vim-gui-common or similar."
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Package configurations and Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" => tpope/vim-fugitive
hi DiffAdd      gui=none    guifg=NONE          guibg=#bada9f
hi DiffChange   gui=none    guifg=NONE          guibg=#e5d5ac
hi DiffDelete   gui=bold    guifg=#ff8080       guibg=#ffb0b0
hi DiffText     gui=none    guifg=NONE          guibg=#8cbee2

" => jmcantrell/vim-virtualenv
let g:lightline = {
            \ 'colorscheme': 'wombat',
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ],
            \             [ 'gitbranch', 'virtualenv', 'readonly', 'filename', 'modified' ] ]
            \ },
            \ 'component_function': {
            \   'gitbranch': 'FugitiveHead',
            \   'virtualenv': 'virtualenv#statusline',
            \ },
            \ }
" => Jedi

" Protip:
" Use <C-g> and <C-d> to goto in Python. And <C-i>, <C-o>, to jump back and forth.

" Jedi Python version.
let g:jedi#force_py_version = 3

"Jedi automatically starts the completion, if you type a dot, e.g. str., if
"you if you don't want this:
let g:jedi#popup_on_dot = 1

" Disable mapping to ,s because split command is mapped to this as well.
" see <leader>s
let g:jedi#goto_stubs_command = ''

" I don't want the docstring to popup during completion.
" Source: https://github.com/davidhalter/jedi-vim
" autocmd FileType python setlocal completeopt-=preview

" => supertab
let g:SuperTabDefaultCompletionType = "<c-n>"

" => Ale

" Ale use flake8 as linter. flake8 has to be pip installed.
" Install flake8 and pylint in the virtualenv.
let g:ale_linters = {'python': ['flake8']}
" Disable auto-detection of virtualenvironments
" Environment variable ${VIRTUAL_ENV} is always used
let g:ale_virtualenv_dir_names = []

" => gv.vim
map <leader>c :GV<CR>

" => fzf
nnoremap <leader>f :Rg<CR>

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""

" Always show the status line
set laststatus=2

" Format the status line
" set statusline=\ %F%m%r%h%{FugitiveStatusline()}\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Map <Space> to / (search)
map <space> /

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Specify the behavior when switching between buffers
try
set switchbuf=useopen,usetab,newtab
set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Remove default when pasting text in visual mode
" Source: https://vim.fandom.com/wiki/Replace_a_word_with_yanked_text
xnoremap p "_dP

" Select only to end of word in visual mode.
xnoremap w e

" Select all after cursor in visual mode.
vnoremap <S-E> g_

" Select all before cursor in visual mode.
vnoremap <S-B> 0

" Fast saving.
nnoremap <leader>w :w!<cr>

" Removes trailing whitespace when saving a python and script.
autocmd BufWritePre *.py %s/\s\+$//e
autocmd BufWritePre *.sh %s/\s\+$//e

" Fast exit.
nnoremap <leader>q :q!<cr>
inoremap <leader>q :q!<cr>
vnoremap <leader>q :q!<cr>
tnoremap <leader>q <c-w>:q!<cr>

" Fast terminal.
nnoremap <leader>t :vertical rightbelow terminal<cr>

" Fast terminal normal mode.
tnoremap <leader>n <C-w>N

" Fast split.
nnoremap <leader>e :Explore<cr>
nnoremap <leader>s :Sexplore<cr>
nnoremap <leader>v :Vexplore!<cr>

" Remove search results.
nnoremap <Esc><Esc> :<C-u>nohlsearch<CR>

" Insert line above or below.
map <leader>o o<Esc>
map <leader>O O<Esc>

" Jump to mark instead of line.
nnoremap ' `

" Move between windows easier.
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-k> <C-w>k
nnoremap <C-j> <C-w>j
tnoremap <C-l> <C-w>l
tnoremap <C-h> <C-w>h
tnoremap <C-k> <C-w>k
tnoremap <C-j> <C-w>j

" Send line(s) to terminal window.
" nnoremap <leader>f yy \| :call term_sendkeys(term_list()[0], @")<CR>
" vnoremap <leader>f y \| :call term_sendkeys(term_list()[0], @")<CR>

" Remap this otherwise <C-l> seems to be fucked up on mac...
nnoremap <leader>l <Plug>NetrwRefresh

" Remap goto in docs.
nnoremap <leader>g <C-]>

" Auto close of brackets.
" inoremap { {}<left>
" inoremap {<CR> {<CR>}<ESC>O
" inoremap [ []<left>
" inoremap [<CR> [<CR>]<ESC>O
" inoremap ( ()<left>
" inoremap (<CR> (<CR>)<ESC>O

" Indent automatically when pasting.
" References: https://vim.fandom.com/wiki/Format_pasted_text_automatically
nnoremap p p=`]

" Jump to the prev/next when using :grep
nnoremap <leader>n :cn<CR>zv
nnoremap <leader>p :cp<CR>zv


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction
