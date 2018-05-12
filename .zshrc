export PATH=$HOME/bin:/usr/local/bin:$PATH

source ~/.aliases
source ~/.functions

if [ -f .secrets ]; then
  source .secrets
fi

export CLICOLOR=1
export LSCOLORS=BxFxCxDxBxegedabagaced # For dark background

# AVN
# export PATH="$HOME/.npm-packages/bin:$PATH"
# [[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh"

# NVM
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
# [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" --no-use

# Go
export GOROOT=/usr/local/opt/go/libexec
export GOPATH=$HOME/.go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

# Cargo
export PATH="$HOME/.cargo/bin:$PATH"

# RVM
# source ~/.rvm/scripts/rvm

# Theme
source ~/.zsh/themes/light.zsh-theme

# Case insensitive autocompletion
autoload -U compinit
compinit
setopt completeinword
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# change directories without cd
setopt auto_cd

SAVEHIST=10
HISTFILE=~/.zsh_history

#if command -v tmux>/dev/null; then
#  [[ ! $TERM =~ screen ]] && [ -z $TMUX ] && exec tmux
#fi

# zsh-autosuggestions
source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '≥' autosuggest-accept   # option >
bindkey '÷' autosuggest-execute  # option ?
