export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH=~/.oh-my-zsh
ZSH_CUSTOM=~/.zsh
ZSH_THEME="nord"

# Lighter iTerm theme titlebar
# printf -- $'\033]6;1;bg;red;brightness;70\a\033]6;1;bg;green;brightness;70\a\033]6;1;bg;blue;brightness;70\a'

# Nord iTerm theme titlebar
# printf -- $'\033]6;1;bg;red;brightness;46\a\033]6;1;bg;green;brightness;52\a\033]6;1;bg;blue;brightness;64\a'

source ~/.aliases
source ~/.functions

if [ -f .secrets ]; then
  source .secrets
fi

export CLICOLOR=1
export LSCOLORS=BxFxCxDxBxegedabagaced # For dark background

# AVN
export PATH="$HOME/.npm-packages/bin:$PATH"
[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# Go
export GOROOT=/usr/local/opt/go/libexec
export GOPATH=$HOME/.go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

# Cargo
export PATH="$HOME/.cargo/bin:$PATH"

# RVM
source ~/.rvm/scripts/rvm

# ZSH/oh-my-zsh options

# Disable auto-setting terminal title
DISABLE_AUTO_TITLE="true"

# Enable command auto correction
ENABLE_CORRECTION="false"
unsetopt correct_all

plugins=(
  npm
  zsh-autosuggestions
)

# zsh-autosuggestions
bindkey '>' autosuggest-accept
bindkey '?' autosuggest-execute

source $ZSH/oh-my-zsh.sh
