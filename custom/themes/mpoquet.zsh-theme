#!/usr/bin/env zsh
setopt promptsubst # needed to call git_prompt_info every prompt display
setopt nopromptcr # prevent message loss when the prompt is printed

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}●"
ZSH_THEME_GIT_PROMPT_CLEAN=""

if [[ -v NIX_CONF_DIR ]]; then
  PROMPT_PART0="%{$fg[cyan]%}(nix-chroot)%{$reset_color%} "
fi

if [[ -v IN_NIX_SHELL ]]; then
  PROMPT_PART1="%{$fg[green]%}(nix-shell)%{$reset_color%} "
fi

if [ $UID -eq 0 ] ; then
  PROMPT_PART2="%{$fg[red]%}%n%{$reset_color%}@%{$fg[yellow]%}%m%{$reset_color%}: "
elif [[ -v SSH_TTY ]]; then
  PROMPT_PART2="%{$fg[magenta]%}%n%{$reset_color%}@%{$fg[yellow]%}%m%{$reset_color%}: "
fi

PROMPT=$'${PROMPT_PART1}${PROMPT_PART2}%{$fg_bold[blue]%}%~%{$reset_color%}$(git_prompt_info) $ '
RPROMPT='%(?,,%{$fg[red]%}FAIL: $?%{$reset_color%})'
