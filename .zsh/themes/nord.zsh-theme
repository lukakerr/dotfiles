git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

NORD1=$'\e[0;30m'
NORD2=$'\e[0;34m'
NORD3=$'\e[0;36m'
NORD4=$'\e[1;30m'
NORD5=$'\e[1;30m'
WHITE=$'\e[0;37m'
RED=$'\e[1;31m'
GREEN=$'\e[1;32m'
RESET=$'\e[0;m'

# Wrap prompt in chpwd function
# Only way that works to check if git repo on every cd
function precmd() {
  PS1=%{$NORD5%}
  PS1+=%~

  # If there are uncommitted git changes, git branch is red, else green
  if [ -d .git ]; then
    if [[ `git status --porcelain` ]]; then
      PS1+=%{$RED%}
    else
      PS1+=%{$GREEN%}
    fi
  fi
  PS1+="\$(git_branch) "
  PS1+=%{$NORD3%}
  PS1+="➔"
  PS1+=%{$WHITE%}%{$RESET%}
  PS1+=' '
}

PS2=%{$NORD3%}
PS2+='❯'
PS2+=%{$RESET%}
PS2+=' '

export PS1;
export PS2;

precmd