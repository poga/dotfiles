export BASH_SILENCE_DEPRECATION_WARNING=1

if [[ $- == *i* ]]; then
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
  BLUE="\[$(tput setaf 4)\]"
  BOLD="\[$(tput bold)\]"
  RESET="\[$(tput sgr0)\]"

  export PS1="\n[${BLUE}${BOLD}\h${RESET}:${GREEN}\w${RESET}] ${RED}\$(git_branch)${RESET}${YELLOW}\$(git_since_last_commit)${RESET}$ "
fi

# Alias
alias g='git'
alias l='ls -al'
alias py='python3'

export EDITOR=vim
alias vim=nvim

# Git bash completion
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

if [ -x "$(command -v cargo)" ]; then
  source $HOME/.cargo/env
fi
export PATH=$PATH:~/.local/bin

export LC_CTYPE="en_US.UTF-8"
export LANG=en_US.UTF-8

if [ -x "$(command -v exa)" ]; then
  alias ls='exa'
fi
if [ -x "$(command -v bat)" ]; then
  alias cat='bat --style="changes"'
fi

if [ -x "$(command -v git)" ]; then
  git config --global alias.co checkout
  git config --global alias.ci commit
  git config --global alias.ic commit
  git config --global alias.st status
  git config --global alias.br branch

  git config --global user.name "Poga Po"
  git config --global user.email poga.po@gmail.com
  git config --global core.editor nvim
fi

export PATH=$PATH:/Applications/Racket\ v8.0/bin
export PATH=$PATH:/Applications/Julia-1.5.app/Contents/Resources/julia/bin
export GOPATH=$HOME/projects/go

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$HOME/.cargo/bin:$PATH"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export LIBRARY_PATH="$LIBRARY_PATH:/usr/local/lib"

export FZF_DEFAULT_COMMAND='rg --files --hidden'

test -r /Users/poga/.opam/opam-init/init.sh && . /Users/poga/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

export PATH="/usr/local/opt/llvm/bin:$PATH"
export PATH=~/.vim/plugged/vim-iced/bin:$PATH

alias tmux='tmux -2'
eval $(/opt/homebrew/bin/brew shellenv)

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/poga/projects/google-cloud-sdk/path.bash.inc' ]; then . '/Users/poga/projects/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/poga/projects/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/poga/projects/google-cloud-sdk/completion.bash.inc'; fi
