# Customised lambda theme with bold green lambda that is red when false and github info at the right with colorised asterisk when dirty
# git prompt
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

#Customized git status, oh-my-zsh currently does not allow render dirty status before branch
git_custom_status() {
  local cb=$(current_branch)
  if [ -n "$cb" ]; then
    echo "$(parse_git_dirty)%{$fg_bold[yellow]%}$(work_in_progress)%{$reset_color%}$ZSH_THEME_GIT_PROMPT_PREFIX$(current_branch)$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
}

# vi-mode mode indicator
MODE_INDICATOR="%{$fg[red]%}<<<%{$reset_color%}"

vi_mode_prompt_info() {
    echo "${${KEYMAP/vicmd/$MODE_INDICATOR}/(main|viins)/}"
}

RPS1='$(git_custom_status)$(vi_mode_prompt_info)$EPS1'

PROMPT='%(?.%{$fg_bold[green]%}.%{$fg_bold[red]%})λ%{$reset_color%} %~/ %{$reset_color%}'

# vim: set ft=zsh:
