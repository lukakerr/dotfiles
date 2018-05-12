source ~/.aliases
source ~/.functions

if [ -f .secrets ]; then
  source .secrets
fi

RED='\[\e[0;31m\]'
GREEN='\[\e[0;32m\]'
YELLOW='\[\e[0;33m\]'
WHITE='\[\e[0;37m\]'
RESET="\[\e[0m\]"

git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Default iTerm theme
COLOR1="\[\033[01;38;5;166m\]"
COLOR2="\[\033[01;38;5;167m\]"
COLOR3="\[\033[01;38;5;168m\]"
COLOR4="\[\033[01;38;5;172m\]"
COLOR5="\[\033[01;38;5;202m\]"

# Nord iTerm theme
NORD1="\[\033[30m\]"
NORD2="\[\033[34m\]"
NORD3="\[\033[36m\]"
NORD4="\[\033[1;30m\]"
NORD5="\[\033[1;30m\]"

PS1="${NORD5}\w"
PS1+="${NORD4}\$(git_branch) ${NORD1}"
PS1+="${NORD3}λ";
PS1+="${WHITE} ${RESET}";

export PS1;
export PS2="\[${COLOR3}\]❯\[\033[m\] "
