# Variables
export EDITOR='vim'
export VISUAL='vim'
export BROWSER='firefox'
export XIVIEWER='feh'
export PLAYER='mpv'
PATH=$(cope_path):$PATH:~/scripts:~/scripts/colourscripts:~/scripts/gibo
#PATH=$PATH:~/scripts:~/scripts/colourscripts

# colourise less output using pygmantize (or source-highlight)
export LESS='-R'
export LESSOPEN='|~/.lessfilter %s'
#export LESSOPEN='|~/scripts/src-hilite-lesspipe.sh %s'

# powerline
# . /usr/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh

# 'Command not found' hook provided by pkgfile for Arch Linux
source /usr/share/doc/pkgfile/command-not-found.zsh

# sudo plugin (with vi-mode support)
source ~/.zsh-custom/plugins/sudo.zsh

# gibo (.gitignore boiler plate) zsh completion
source ~/scripts/gibo/gibo-completion.zsh

## Antigen
#source ~/.zsh-custom/plugins/antigen.zsh

# Colours
red='\e[0;31m'
RED='\e[1;31m'
green='\e[0;32m'
GREEN='\e[1;32m'
yellow='\e[0;33m'
YELLOW='\e[1;33m'
blue='\e[0;34m'
BLUE='\e[1;34m'
purple='\e[0;35m'
PURPLE='\e[1;35m'
cyan='\e[0;36m'
CYAN='\e[1;36m'
NC='\e[0m'

# coloured manpages
man() {
	env \
	LESS_TERMCAP_mb=$(printf '\e[5;31m') \
	LESS_TERMCAP_md=$(printf '\e[1;35m') \
	LESS_TERMCAP_me=$(printf '\e[0m') \
	LESS_TERMCAP_se=$(printf '\e[0m') \
	LESS_TERMCAP_so=$(printf '\e[1;40;33m') \
	LESS_TERMCAP_ue=$(printf '\e[0m') \
	LESS_TERMCAP_us=$(printf '\e[4;32m') \
	man "$@"
}

# LS_COLORS
eval $(dircolors -b $HOME/.dircolors)

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/base16-eighties.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

# ZSH Syntax Highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#source ~/.zsh-custom/plugins/zsh-syntaz-highlighting.zsh

# ZSH Syntax Highlighting options; Needs https://github.com/zsh-users/zsh-syntax-highlighting/
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)

## ZSH functions
source ~/.zsh-custom/functions.zsh

# enable aliases with sudo
alias sudo='sudo '

## custom aliases
# pacman (arch)
source ~/.zsh-custom/aliases/pacman.zsh

# aura (arch)
source ~/.zsh-custom/aliases/aura.zsh       

# misc aliases
source ~/.zsh-custom/aliases/aliases.zsh

## Options
# Extended globbing
setopt extendedGlob

# zmv - a command for renaming files by means of shell pattersn
autoload -U zmv

# zargs, as an alternative to find -exec and xargs
autoload -U zargs

# turn on command substitution in the prompt (and parameter expansion and arithmetic expansion)
setopt promptsubst

# Ignore lines beginning with '#'
setopt interactivecomments

# Ignore duplicates in history
setopt hist_ignore_dups

# Prevent record in history if preceded by whitespace
setopt hist_ignore_space

#History Settings
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=$HISTSIZE

# Completion
autoload -Uz compinit
compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' menu select=2
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion::complete:*' use-cache on
zstyle ':completion:*:descriptions' format '%U%F{green}%d%f%u'

# Make zsh know about hosts already accessed by SSH
zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)'$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)'}%%[# ]*}//,/ })'
