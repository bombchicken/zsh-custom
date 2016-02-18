# Insert sudo before command
# Ripped from oh-my-zsh sudo plugin
# added support for vi-mode, which normally breaks this

sudo-command-line() {
    [[ -z $BUFFER ]] && zle up-history
    [[ $BUFFER != sudo\ * ]] && LBUFFER="sudo $LBUFFER"
}
zle -N sudo-command-line
# Define shortcut keys
bindkey -M vicmd "\e\e" sudo-command-line       # [esc] [esc] in vi command mode
bindkey '^s' sudo-command-line                  # ctrl-!
