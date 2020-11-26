source /usr/local/etc/bash_completion.d/git-prompt.sh
source /usr/local/etc/bash_completion.d/git-completion.bash

alias ls='ls -FG'
alias ll='ls -alFG'
alias be='bundle exec'
alias g='cd $(ghq list --full-path | peco)'
alias b='git branch | peco | xargs git switch'

if type __git_ps1 > /dev/null 2>&1; then
  PROMPT_COMMAND="__git_ps1 '\[\033[32m\]\u@\h\[\033[00m\]:\[\033[34m\]\W\[\033[00m\]' '$ '; $PROMPT_COMMAND"
  GIT_PS1_SHOWDIRTYSTATE=true
  GIT_PS1_SHOWSTASHSTATE=true
  GIT_PS1_SHOWUNTRACKEDFILES=true
  GIT_PS1_SHOWUPSTREAM="auto"
  GIT_PS1_SHOWCOLORHINTS=true
fi
