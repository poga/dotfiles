export BASH_SILENCE_DEPRECATION_WARNING=1
export KUBE_PS1_NS_ENABLE=false
export KUBE_PS1_SYMBOL_ENABLE=false
export KUBE_PS1_PREFIX='['
export KUBE_PS1_SUFFIX=']'
export KUBE_PS1_CTX_COLOR=yellow
source "/opt/homebrew/opt/kube-ps1/share/kube-ps1.sh"

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

  export PS1="\n[${BLUE}${BOLD}\h${RESET}:${GREEN}\w${RESET}] \$(kube_ps1) ${RED}\$(git_branch)${RESET}${YELLOW}\$(git_since_last_commit)${RESET}\n:; "
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

source $HOME/.cargo/env
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
  git config --global user.email hi@devpoga.org
  git config --global core.editor nvim
fi

export PATH=$PATH:/Applications/Julia-1.6.app/Contents/Resources/julia/bin

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


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

# homebrew LLVM
# export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
# export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"
#
# export CPATH=$CPATH:/opt/homebrew/include
# export LIBRARY_PATH=$LIBRARY_PATH:/opt/homebrew/lib
#
# export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export KUBE_EDITOR=nvim

eval "$(direnv hook bash)"

alias k='kubectl'
alias kp='kube-prompt'
alias lg='lazygit'

export PATH=$PATH:~/.mix/escripts

eval "$(pyenv init --path)"


export PATH="$HOME/.poetry/bin:$PATH"

 test -s "$HOME/.kiex/scripts/kiex" && source "$HOME/.kiex/scripts/kiex"
. "$HOME/.cargo/env"
