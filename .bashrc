source /usr/local/etc/bash_completion.d/git-prompt.sh
source /usr/local/etc/bash_completion.d/git-completion.bash

shopt -s autocd

alias ls='ls -FG'
alias ll='ls -alFG'
alias be='bundle exec'
alias g='ghq look $(ghq list | peco)'
alias b='git branch | peco | xargs git checkout'

if type docker > /dev/null 2>&1; then
  alias drm='docker rm $(docker ps -aqf "status=exited")'
  alias drmi='docker rmi $(docker images -aqf "dangling=true")'
fi

if type docker-compose > /dev/null 2>&1; then
  alias dc='docker-compose'
fi

# @see https://github.com/pyenv/pyenv/issues/106#issuecomment-440826532
if type pyenv > /dev/null 2>&1; then
  alias brew="env PATH=${PATH//$(pyenv root)\/shims:/} brew"
fi

if type __git_ps1 > /dev/null 2>&1; then
  PROMPT_COMMAND="__git_ps1 '\[\033[32m\]\u@\h\[\033[00m\]:\[\033[34m\]\w\[\033[00m\]' '$ '; $PROMPT_COMMAND"
  GIT_PS1_SHOWDIRTYSTATE=true
  GIT_PS1_SHOWSTASHSTATE=true
  GIT_PS1_SHOWUNTRACKEDFILES=true
  GIT_PS1_SHOWUPSTREAM="auto"
  GIT_PS1_SHOWCOLORHINTS=true
fi
