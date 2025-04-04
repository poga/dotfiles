# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"
#
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
source $ZSH/oh-my-zsh.sh

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

if [ -x "$(command -v eza)" ]; then
alias ls='eza'
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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export LIBRARY_PATH="$LIBRARY_PATH:$(brew --prefix)/lib"

source "$HOME/.deno/env"
eval "$(mise activate zsh)"
