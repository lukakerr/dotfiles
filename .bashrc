source ~/.aliases
source ~/.functions

if [ -f .secrets ]; then
  source .secrets
fi

PS1="\\033[37m\w"
PS1+="\\033[32m λ \\033[0m";

export PS1;
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
