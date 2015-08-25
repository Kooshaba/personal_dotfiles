#!/bin/bash

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='subl -w'
fi

alias gitconfig="git config --edit"
alias gca="git commit --amend --reset-author"

alias be="bundle exec"
alias bashconfig="$EDITOR ~/personal_dotfiles/ && reload"
alias cpkey="pbcopy < ~/.ssh/id_rsa.pub"
alias reload=". ~/.bash_profile && echo 'bash config reloaded from ~/.bash_profile'"
alias h="history 40"

psgrep() { ps aux | grep $1 | grep -v grep; }
killsophos() { psgrep sophos | awk '{print $2}' | xargs sudo kill -9; }


alias matrix='LC_ALL=C tr -c "[:digit:]" " " < /dev/urandom | dd cbs=$COLUMNS conv=unblock | GREP_COLOR="1;32" grep --color "[^ ]"'

if [ $SSH_TTY ]; then
  PS1="$RED\u@\h $RED\w $LIGHTRED\$(current_git_branch)\$(git_special)$YELLOW\$(local_user)$LIGHTRED$ $NC"
  PS1="$PS1\[\e]0;\u@\h\a\]"
else
  PS1="$GREEN\u@\h $RED\w$NC $BROWN\$(current_git_branch)\$(git_special)$BROWN\n[\@]$RED\!$YELLOW\$(local_user)$GREEN$ $NC"
  PS1="$PS1\[\e]0;\a\]"
fi