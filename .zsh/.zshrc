autoload -Uz vcs_info
precmd() { vcs_info }
setopt PROMPT_SUBST
PROMPT='[%D{%H:%M:%S}] %n@%m:%~${vcs_info_msg_0_} %\# '
