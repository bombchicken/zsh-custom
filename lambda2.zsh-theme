# ZSH Theme - Preview: http://cl.ly/350F0F0k1M2y3A2i3p1S
# Customised lambda theme with bold green lambda that is red when false and github info at the right with colorised asterisk when dirty
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

RPS1='$(git_custom_status) $EPS1'

PROMPT='%(?.%{$fg_bold[green]%}.%{$fg_bold[red]%})λ%{$reset_color%} %~/ %{$reset_color%}'

