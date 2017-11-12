printf -- $'\033]6;1;bg;red;brightness;70\a\033]6;1;bg;green;brightness;70\a\033]6;1;bg;blue;brightness;70\a'

source ~/.aliases
source ~/.functions

if [ -f .secrets ]; then
	source .secrets
fi

export CLICOLOR=1
export LSCOLORS=BxFxCxDxBxegedabagaced # For dark background

RED='\[\e[0;31m\]'
GREEN='\[\e[0;32m\]'
YELLOW='\[\e[0;33m\]'
WHITE='\[\e[0;37m\]'
RESET="\[\e[0m\]"

git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

COLOR1="\[\033[01;38;5;166m\]"
COLOR2="\[\033[01;38;5;167m\]"
COLOR3="\[\033[01;38;5;168m\]"
COLOR4="\[\033[01;38;5;172m\]"
COLOR5="\[\033[01;38;5;202m\]"

PS1="${COLOR5}\w"
PS1+="${COLOR4}\$(git_branch) ${COLOR1}"
PS1+="❯${COLOR2}❯${COLOR3}❯"; # Working directory full path
PS1+="${WHITE} ${RESET}"; # Reset

export PS1;
export PS2="\[${COLOR3}\]❯\[\033[m\] " # Secondary prompt

export PATH="$HOME/.npm-packages/bin:$PATH"
[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh" # AVN
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # NVM
[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh  # This loads NVM

source ~/.rvm/scripts/rvm # RVM