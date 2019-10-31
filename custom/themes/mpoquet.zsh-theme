ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}●"
ZSH_THEME_GIT_PROMPT_CLEAN=""

if [ $UID -eq 0 ] ; then
  PROMPT_PART1="%{$fg[red]%}%n%{$reset_color%}@%{$fg[yellow]%}%m%{$reset_color%}: "
elif [[ -v SSH_TTY ]]; then
  PROMPT_PART1="%{$fg[magenta]%}%n%{$reset_color%}@%{$fg[yellow]%}%m%{$reset_color%}: "
fi

PROMPT=$'${PROMPT_PART1}%{$fg_bold[blue]%}%~%{$reset_color%}$(git_prompt_info) $ '
RPROMPT='%(?,,%{$fg[red]%}FAIL: $?%{$reset_color%})'
