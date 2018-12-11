# Git
source ~/.git-prompt.sh
source ~/.git-completion.bash

GIT_PS1_SHOWDIRTYSTATE=true
export PS1='\[\033[37m\]\w:\[\033[36m\]$(__git_ps1 [%s])\[\033[00m\]\$ '

# Aliases
alias ll='ls -lhG'
alias la='ls -lahG'
alias be='bundle exec'

alias mv='mv -i'
alias rm='rm -i'
alias cp='cp -ip'

alias memo='cd ~/memo'
