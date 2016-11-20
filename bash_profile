parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "
export PATH=/Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin:$PATH
export EDITOR="vim"

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

function pg_kill_db() {
   psql -d $1 -c "select pg_terminate_backend(pg_stat_activity.pid) from pg_stat_activity where pg_stat_activity.datname = '${1}' and pid <> pg_backend_pid();";
}

alias start_tomcat='cd; ./my/toolbox/tomcat-6.0.18/bin/catalina.sh run'
alias core='cd ~/src/better-core'
alias bprof='cd ~; mvim .bash_profile'
alias build_all='cd ~/src/better-core; boxen webapp; ./bootstrap.sh; ./fresh -fs; gradle clean web-api:war ruby; cd retail; rake db:migrate; cd frontend/app; grunt;'
alias kill-retail-connections="psql -c 'select pg_terminate_backend(pg_stat_activity.pid) from pg_stat_activity where pg_stat_activity.datname = '\''retail_development'\'' and pid <> pg_backend_pid()'"

alias gd='git diff'
alias gst='git status'
alias ga='git add'
alias gaa='git add .'
alias gamend='git add .; git commit --amend;'
alias gs='git stash'
alias gbranches="git for-each-ref --sort=-committerdate refs/heads/ --format='%(refname:short)' --count 8"
alias gc='git commit'
alias greset='git reset'
alias gwip="git add .; git commit -m 'wip';"
alias gco='git checkout'
alias ghist="git log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short head -25"
alias gundolast="git reset --soft HEAD^"



source /opt/boxen/env.sh
