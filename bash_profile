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
BOLD="\[$(tput bold)\]"
RESET="\[$(tput sgr0)\]"

export PS1="\n[${GREEN}${BOLD}\h${RESET}:${GREEN}\w${RESET}] ${RED}\$(git_branch)${RESET}${YELLOW}\$(git_since_last_commit)${RESET}$ "

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
export LANG=en_US.UTF-8

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/poga/projects/google-cloud-sdk/path.bash.inc' ]; then source '/Users/poga/projects/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/poga/projects/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/poga/projects/google-cloud-sdk/completion.bash.inc'; fi

alias ls='exa'
alias cat='bat'

export PATH=$PATH:$HOME/.conduit/bin
export PATH=$PATH:/Applications/Racket\ v7.5/bin
export PATH=$PATH:/Applications/Julia-1.3.app/Contents/Resources/julia/bin
export GOPATH=$HOME/projects/go

export PATH=$PATH:$HOME/projects/go/bin

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$HOME/.cargo/bin:$PATH"

# Wasmer
export WASMER_DIR="/Users/poga/.wasmer"
[ -s "$WASMER_DIR/wasmer.sh" ] && source "$WASMER_DIR/wasmer.sh"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export LIBRARY_PATH="$LIBRARY_PATH:/usr/local/lib"

# gerbil
export PATH=/usr/local/opt/gambit-scheme/current/bin:/usr/local/opt/gerbil-scheme/libexec/bin:$PATH
export GERBIL_HOME=/usr/local/opt/gerbil-scheme/libexec

alias py='python3'
export FZF_DEFAULT_COMMAND='rg --files --hidden'
