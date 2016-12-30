export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

function git_branch {
    ref=$(git symbolic-ref HEAD 2> /dev/null) || return;
    echo "("${ref#refs/heads/}") ";
}

function git_since_last_commit {
    now=`date +%s`;
    last_commit=$(git log --pretty=format:%at -1 2> /dev/null) || return;
    seconds_since_last_commit=$((now-last_commit));
    minutes_since_last_commit=$((seconds_since_last_commit/60));
    hours_since_last_commit=$((minutes_since_last_commit/60));
    minutes_since_last_commit=$((minutes_since_last_commit%60));

    echo "${hours_since_last_commit}h${minutes_since_last_commit}m ";
}

export PS1="\n[\[\e[0;31m\]\w\[\e[m\]] \[\033[0m\]\[\033[1;36m\]\e[3m\$(git_branch)\e[0m\[\033[0m\]\[\033[1;32m\]\$(git_since_last_commit)\[\033[0m\]\[\033[0m\]\[\033[0;33m\]\[\e[1;33m\]\[\e[m\]🐱  "

# Alias
alias g='git'
alias l='ls -al'

alias ,,='cd ..'

export EDITOR=vim
alias vim=nvim

# Git bash completion
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

source $HOME/.cargo/env

export RUST_SRC_PATH=~/.rustup/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src
