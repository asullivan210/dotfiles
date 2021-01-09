# Find and set branch name var if in git repository.
function git_branch_name()
{
  branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
  if [[ $branch == "" ]];
  then
    :
  else
    echo '- ('$branch')'
  fi
}

# Enable substitution in the prompt.
setopt prompt_subst

# Config for prompt. PS1 synonym.
PROMPT='%2/ %F{yellow}$(git_branch_name) %f'

export PATH=/Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin:$PATH
export EDITOR="vim"
export HOMEBREW_CASK_OPTS="--appdir=~/Applications"

# goes with brew install bash-completion
# if [ -f /usr/local/share/bash-completion/bash_completion ]; then
#    . /usr/local/share/bash-completion/bash_completion
# fi


alias bprof='mvim ~/.bash_profile'
alias dev='cd ~/development'
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
