git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

NORD1=$'\e[0;30m'
NORD2=$'\e[0;34m'
NORD3=$'\e[0;32m'
NORD4=$'\e[0;30m'
NORD5=$'\e[0;37m'
WHITE=$'\e[0;37m'
RED=$'\e[0;31m'
GREEN=$'\e[0;32m'
RESET=$'\e[0;m'

# Wrap prompt in precmd function
# Only way that works to check if git repo after every entered command
function precmd() {
  PS1=%{$NORD1%}
  PS1+='~'
  PS1+=$(echo $(pwd) | sed -e "s%$HOME%%g" | perl -pe "s/(\w)[^\/]+\//\1\//g")
  # PS1+=${${:-/${(j:/:)${(M)${(s:/:)${(D)PWD:h}}#(|.)[^.]}}/${PWD:t}}//\/~/\~}
  PS1+=" "
  PS1+=%{$NORD3%}
  PS1+="λ "
  PS1+=%{$WHITE%}%{$RESET%}

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

PS2=%{$NORD3%}
PS2+='❯'
PS2+=%{$RESET%}
PS2+=' '

export PS1;
export PS2;
