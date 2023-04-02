autoload -Uz vcs_info
precmd() { vcs_info }
setopt PROMPT_SUBST
PROMPT='[%D{%H:%M:%S}] %n@%m:%~${vcs_info_msg_0_} %\# '

if ! command -v rbenv &> /dev/null; then
  eval "$(rbenv init - zsh)"
fi
