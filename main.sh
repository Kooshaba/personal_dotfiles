#!/bin/bash

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

alias gitconfig="git config --edit"
alias gc="git commit"
alias gca="gc --amend --reset-author"
alias gcan="gca --no-edit"
alias gpr="git pull --rebase"
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias glh="gl | head"
alias gst="git status"
alias gv="git pull --rebase"
alias 'g^'="git push -u origin HEAD"

alias dc="docker-compose"
alias d="docker"
alias dlogs="tail -f ~/Library/Containers/com.docker.docker/Data/com.docker.driver.amd64-linux/log/docker.log"

dnuke() { docker rm $(docker ps -a -q); }
dnukei() { docker rmi $(docker images | grep 'none>' | awk '{print $3}'); }
dbash() { docker run -it $1 /bin/bash; }

alias etm="ember t --module"
alias etf="ember t -f"

alias be="bundle exec"
# alias bashconfig="$EDITOR ~/workspace/personal_dotfiles/main.sh && reload"
alias cpkey="pbcopy < ~/.ssh/id_rsa.pub"
alias reload=". ~/.zshrc && echo 'reloaded .zshrc'"
alias h="history 40"

alias p="psql"
alias pdw="p data_warehouse_dev"

alias eurodate="date +'%d_%m_%Y'"
alias pdate="date +'%Y_%m_%d'"
alias date_folder="mkdir `pdate`"

alias work="cd ~/workspace"

# alias ssh="~/workspace/personal_dotfiles/ssh-host-color"
alias grep="grep --color=auto"

psgrep() { ps aux | grep $1 | grep -v grep; }
pskill() { psgrep $1 | awk '{print $2}' | xargs sudo kill -9; }
watch() { while :; do clear; $1; sleep 2; done }

alias matrix='LC_ALL=C tr -c "[:digit:]" " " < /dev/urandom | dd cbs=$COLUMNS conv=unblock | GREP_COLOR="1;32" grep --color "[^ ]"'
