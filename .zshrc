export PATH=$HOME/bin:/usr/local/bin:/$HOME/.local/bin:/usr/local/texlive/2018/bin/x86_64-darwin:$PATH

source ~/.aliases
source ~/.functions

if [ -f .secrets ]; then
  source .secrets
fi

# Hacky way to check if Alacritty is running
# Both Terminal.app and iTerm.app set this var, Alacritty doesn't
# if [ -z "$TERM_PROGRAM" ]; then
#   tmux new-session
#   clear
# fi

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
source ~/.zsh/themes/surreal.zsh-theme
# source ~/.zsh/themes/palenight.zsh-theme
# source ~/.zsh/themes/gruvbox.zsh-theme

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
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=7"
bindkey '≥' autosuggest-accept   # option >
bindkey '÷' autosuggest-execute  # option ?

source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
