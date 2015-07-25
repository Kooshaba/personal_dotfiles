if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nano'
else
  export EDITOR='vim'
fi

alias gitconfig="git config --edit"
alias be="bundle exec"
alias bashconfig="$EDITOR ~/.bashrc && reload"
alias cpkey="pbcopy < ~/.ssh/id_rsa.pub"
alias reload=". ~/.bash_profile && echo 'bash config reloaded from ~/.bash_profile'"

alias matrix='LC_ALL=C tr -c "[:digit:]" " " < /dev/urandom | dd cbs=$COLUMNS conv=unblock | GREP_COLOR="1;32" grep --color "[^ ]"'

if [ $SSH_TTY ]; then
  PS1="$RED\u@\h $RED\w $LIGHTRED\$(current_git_branch)\$(git_special)$YELLOW\$(local_user)$LIGHTRED$ $NC"
  PS1="$PS1\[\e]0;\u@\h\a\]"
else
  PS1="$GREEN\u@\h $RED\w$NC on $BROWN\$(current_git_branch)\$(git_special)$BROWN\n[\@]$YELLOW\$(local_user)$GREEN$ $NC"
  PS1="$PS1\[\e]0;\a\]"
fi
