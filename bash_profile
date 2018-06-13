export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

function git_branch {
    ref=$(git symbolic-ref HEAD 2> /dev/null) || return;
    echo "("${ref#refs/heads/}") ";
}

function git_since_last_commit {
    now=`date +%s`; last_commit=$(git log --pretty=format:%at -1 2> /dev/null) || return;
    seconds_since_last_commit=$((now-last_commit));
    minutes_since_last_commit=$((seconds_since_last_commit/60));
    hours_since_last_commit=$((minutes_since_last_commit/60));
    minutes_since_last_commit=$((minutes_since_last_commit%60));

    echo "${hours_since_last_commit}h${minutes_since_last_commit}m ";
}

GREEN="\[$(tput setaf 2)\]"
YELLOW="\[$(tput setaf 3)\]"
RED="\[$(tput setaf 1)\]"
RESET="\[$(tput sgr0)\]"

export PS1="\n[${GREEN}\w${RESET}] ${RED}\$(git_branch)${RESET}${YELLOW}\$(git_since_last_commit)${RESET}$ "

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
export PATH=$PATH:~/.local/bin

export RUST_SRC_PATH=~/.rustup/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src

export PATH="/Users/poga/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export LC_CTYPE="en_US.UTF-8"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/poga/projects/google-cloud-sdk/path.bash.inc' ]; then source '/Users/poga/projects/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/poga/projects/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/poga/projects/google-cloud-sdk/completion.bash.inc'; fi

alias ls='exa'

# added by Anaconda3 5.1.0 installer
export PATH="/Users/poga/anaconda3/bin:$PATH"
export PATH=$PATH:$HOME/.conduit/bin
