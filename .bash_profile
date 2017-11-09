source .aliases
source .functions

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

PS1="${GREEN}\w"
PS1+="${RED}\$(git_branch) ${GREEN}"
PS1+="›${YELLOW}›${RED}›"; # Working directory full path
PS1+="${WHITE} ${RESET}"; # Reset

export PS1;
export PS2="\[${GREEN}\]›\[\033[m\] " # Secondary prompt

export PATH="$HOME/.npm-packages/bin:$PATH"
[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh" # AVN
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # NVM
[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh  # This loads NVM
source ~/.rvm/scripts/rvm # RVM