#!/bin/bash

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='subl -w'
fi

alias gitconfig="git config --edit"
alias gca="git commit --amend --reset-author"

alias be="bundle exec"
alias bashconfig="$EDITOR ~/workspace/personal_dotfiles/main.sh && reload"
alias cpkey="pbcopy < ~/.ssh/id_rsa.pub"
alias reload=". ~/.bash_profile && echo 'bash config reloaded from ~/.bash_profile'"
alias h="history 40"

alias p="psql"
alias pdw="p data_warehouse_dev"

alias pdate="date +'%d_%m_%Y'"
alias date_folder="mkdir `pdate`"


psgrep() { ps aux | grep $1 | grep -v grep; }
killsophos() { psgrep sophos | awk '{print $2}' | xargs sudo kill -9; }
watch() { while :; do clear; $1; sleep 2; done }

show_colors() {
	echo -e "\n                 40m     41m     42m     43m\
	     44m     45m     46m     47m";

	for FGs in '    m' '   1m' '  30m' '1;30m' '  31m' '1;31m' '  32m' \
	           '1;32m' '  33m' '1;33m' '  34m' '1;34m' '  35m' '1;35m' \
	           '  36m' '1;36m' '  37m' '1;37m';
	  do FG=${FGs// /}
	  echo -en " $FGs \033[$FG  $T  "
	  for BG in 40m 41m 42m 43m 44m 45m 46m 47m;
	    do echo -en "$EINS \033[$FG\033[$BG  $T  \033[0m";
	  done
	  echo;
	done
	echo
}

alias matrix='LC_ALL=C tr -c "[:digit:]" " " < /dev/urandom | dd cbs=$COLUMNS conv=unblock | GREP_COLOR="1;32" grep --color "[^ ]"'

PS1="$GREEN\u@\h $RED\w$NC $BROWN\$(current_git_branch)\$(git_special)$BROWN\n[\@]$RED\!$YELLOW\$(local_user)$GREEN ➤➤➤ $NC"
PS1="$PS1\[\e]0;\a\]"
