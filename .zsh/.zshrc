autoload -Uz vcs_info
precmd() { vcs_info }
setopt PROMPT_SUBST
PROMPT='[%D{%H:%M:%S}] %n@%m:%~${vcs_info_msg_0_} %\# '

alias gcd='cd $(ghq list --full-path | peco)'
alias gsb='git branch | peco | xargs git switch'

if ! command -v rbenv &> /dev/null; then
  eval "$(rbenv init - zsh)"
fi
