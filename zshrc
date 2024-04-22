# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
source "$HOME/.cargo/env"

export PATH=$PATH:/opt/homebrew/bin

PATH="/Users/poga/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/poga/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/poga/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/poga/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/poga/perl5"; export PERL_MM_OPT;

alias l='ls -al'
alias py='python3'

export EDITOR=nvim
alias vim=nvim

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

export LIBRARY_PATH="$LIBRARY_PATH:/usr/local/lib"

export FZF_DEFAULT_COMMAND='rg --files --hidden'

test -r /Users/poga/.opam/opam-init/init.sh && . /Users/poga/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

#export PATH="/usr/local/opt/llvm/bin:$PATH"

alias tmux='tmux -2'
eval $(/opt/homebrew/bin/brew shellenv)


# homebrew LLVM
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"
export PATH="$PATH:/opt/homebrew/opt/llvm/bin"
export KUBE_EDITOR=nvim

eval "$(direnv hook zsh)"

alias k='kubectl'
alias lg='lazygit'

export PATH=$PATH:~/.mix/escripts

eval "$(pyenv init --path)"

export PATH="$HOME/.poetry/bin:$PATH"

source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

alias isvg='rsvg-convert | icat'
alias icat='kitty icat --align=left'
alias s="kitty +kitten ssh"

alias ppp='cd ~/projects'

alias rr='rustrover'
export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"

function frg {
    result=$(rg --ignore-case --color=always --line-number --no-heading . |
      fzf --ansi \
          --color 'hl:-1:underline,hl+:-1:underline:reverse' \
          --delimiter ':' \
          --preview "bat --color=always {1} --theme='Solarized (light)' --highlight-line {2}" \
          --preview-window 'up,60%,border-bottom,+{2}+3/3,~3')
    file=${result%%:*}
    linenumber=$(echo "${result}" | cut -d: -f2)
    if [[ -n "$file" ]]; then
            $EDITOR +"${linenumber}" "$file"
    fi
  }

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/projects/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/projects/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/projects/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/projects/google-cloud-sdk/completion.zsh.inc"; fi

export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

export CPATH=$CPATH:/opt/homebrew/include
export LIBRARY_PATH=$LIBRARY_PATH:/opt/homebrew/lib


export CLOUDSDK_PYTHON_SITEPACKAGES=1
alias g='git'
