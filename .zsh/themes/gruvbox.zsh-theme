git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

NORD1=$'\e[0;30m'
NORD2=$'\e[0;34m'
NORD3=$'\e[1;32m'
NORD4=$'\e[1;30m'
NORD5=$'\e[1;30m'
WHITE=$'\e[0;37m'
RED=$'\e[1;31m'
GREEN=$'\e[1;32m'
RESET=$'\e[0;m'

# Wrap prompt in precmd function
# Only way that works to check if git repo after every entered command
PS1=%{$NORD5%}
PS1+=%~
PS1+=" "

function precmd() {
  if git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    if [[ `git status --porcelain --ignore-submodules -unormal` ]]; then
      RPROMPT=%{$NORD3%}
      RPROMPT+="*"
    else
      RPROMPT=%{$NORD3%}
    fi
  else
    RPROMPT=''
  fi
  RPROMPT+="$(git_branch)"
  RPROMPT+=%{$RESET%}
}

PS1+=%{$NORD3%}
PS1+="λ "
PS1+=%{$WHITE%}%{$RESET%}

PS2=%{$NORD3%}
PS2+='❯'
PS2+=%{$RESET%}
PS2+=' '

export PS1;
export PS2;