# Git
source ~/.git-prompt.sh
source ~/.git-completion.bash

GIT_PS1_SHOWDIRTYSTATE=true
export PS1='\[\033[37m\]\w:\[\033[36m\]$(__git_ps1 [%s])\[\033[00m\]\$ '

## bash-completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

# Aliases
alias ll='ls -lhG'
alias la='ls -lahG'
alias tail='tail -f'
alias mv='mv -i'
alias rm='rm -i'
alias cp='cp -ip'
alias echoPATH="echo $PATH |  tr ':' '\n'"
alias be='bundle exec'
alias memo='cd ~/memo'
