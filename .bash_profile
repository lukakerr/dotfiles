alias tu="sudo sysctl debug.lowpri_throttle_enabled=0"
alias pg_start="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
alias pg_stop="pg_ctl -D /usr/local/var/postgres stop"
alias mongod="ulimit -n 4096 && mongod"

export CLICOLOR=1
export LSCOLORS=BxFxCxDxBxegedabagaced # For dark background

export PATH="$HOME/.npm-packages/bin:$PATH"
[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh  # This loads NVM

RED='\[\e[0;31m\]'
GREEN='\[\e[0;32m\]'
YELLOW='\[\e[0;33m\]'
BLUE='\[\e[0;34m\]'
CYAN='\[\e[0;36m\]'
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

# Goes up a certain amount of directories
# Usage: up 2
function up() {
	local d=""
	limit=$1
	for ((i=1 ; i <= limit ; i++))
		do
			d=$d/..
		done
	d=$(echo $d | sed 's/^\///')
	if [ -z "$d" ]; then
		d=..
	fi
	cd $d
}

[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh" # AVN
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # NVM

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

if [ -f .secrets ]; then
	source .secrets
fi
