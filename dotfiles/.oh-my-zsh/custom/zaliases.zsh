function _cd() {
    builtin cd "$@"
    pwd >> ~/.gg
    sort -o ~/.gg -u ~/.gg
    if [[ -d ./venv ]] ; then
        if [[ "$VIRTUAL_ENV" != "$(pwd)/venv" ]] ; then
            echo "Automatically deactivating $VIRTUAL_ENV"
            deactivate 1> /dev/null 2> /dev/null
            echo "Automatically activating $(pwd)/venv"
            source $(pwd)/venv/bin/activate
        fi
    fi
}

function _gg() {
    cd $((cat ~/.gg; dirs -l -p; ls -d ~/Git/*; ls -d ~/Setup/dotfiles) | cat | sort -u | fzf --preview "tree -L 1 -C --noreport {}" --preview-window=70%,border-double,top)
}

function _gv() {
    dir=$((cat ~/.gg; dirs -l -p; ls -d ~/Git/*; ls -d ~/Setup/dotfiles) | cat | sort -u | fzf --preview "tree -L 1 -C --noreport {}" --preview-window=70%,border-double,top)
    cd $dir
    nvim $dir
}

function _gl() {
    echo "Branches"
    git for-each-ref --sort='-authordate:iso8601' --format=' %(authordate:relative)%09%(refname:short)' refs/heads
    echo "Worktrees"
    git worktree list
}

alias vim=nvim
alias vi=nvim
alias ll="ls -la"

alias cd=_cd
alias gg=_gg
alias gv=_gv
alias gl=_gl
