alias ya='yaourt --color'

# colordiff
if command -v colordiff > /dev/null 2>&1; then
    alias diff="colordiff -Nuar"
else
    alias diff="diff -Nuar"
fi

# tungsten (wolfram alpha CLI)
if command -v tungsten > /dev/null 2>&1; then	#check if exists, since tungsten is uncommon
    alias wa='tungsten'
fi

# ls
alias ls='ls --color=auto --group-directories-first --classify'
alias l='ls -lFh'     #size,show type,human readable
alias la='ls -lAFh'   #long list,show almost all,show type,human readable
alias lr='ls -tRFh'   #sorted by date,recursive,show type,human readable
alias lt='ls -ltFh'   #long list,sorted by date,show type,human readable
alias ll='ls -l'      #long list
alias ldot='ls -ld .*'
alias l.='ls -ld .*'
alias lS='ls -1FSsh'
alias lart='ls -1Fcart'
alias lrt='ls -1Fcrt'

# grep
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias sgrep='grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS} '

# Command line head / tail shortcuts
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g L='| less'
alias -g M='| most'
alias -g LL='2>&1 | less'
alias -g CA='2>&1 | cat -A'
alias -g NE='2> /dev/null'
alias -g NUL='> /dev/null 2>&1'
alias -g P='2>&1| pygmentize -l pytb'
alias t='tail -f'

# misc
alias dud='du -d 1 -h'
alias duf='du -sh *'
alias fd='find . -type d -name'
alias ff='find . -type f -name'

alias rcp='rsync -v --progress'
alias rmv='rsync -v --progress --remove-source-files'

alias h='history'
alias j='jobs -l'
alias hgrep='fc -El 0 | grep'
alias help='man'
alias p='ps -f'

alias sortnr='sort -n -r'
alias unexport='unset'
alias path='echo -e ${PATH//:/\\n}'

alias header='curl -I'
alias headerc='curl -I --compress'

alias rm='rm -I --preserve-root'        # safe but non-intrusive rm
alias rmf='rm -rf'
alias cp='cp -i'
alias mv='mv -i'
alias ln='ln -i'

alias mkdir='mkdir -pv'

alias chown='chown -c --preserve-root'
alias chmod='chmod -c --preserve-root'
alias chgrp='chgrp -c --preserve-root'

alias ipt='sudo iptables'
alias iptlist='sudo iptables -L -n -v --line-numbers'
alias iptlistin='sudo iptables -L INPUT -n -v --line-numbers'
alias iptlistout='sudo iptables -L OUTPUT -n -v --line-numbers'
alias iptlistfw='sudo iptables -L FORWARD -n -v --line-numbers'

alias more='less'
alias ping='ping -c 5'
alias fastping='ping -c 100 -s.2'
alias epoch='date +%s'
alias wget='wget -c'

# ascii art commands
alias toilet='toilet -t'    # term-width toilet output
alias gay='toilet --gay'    # rainbow toilet output
alias metal='toilet --metal'
alias cowsayr='cowsay -f $(ls /usr/share/cows/ | shuf -n1)' # random cow

# print most commonly used commands
alias common="history | awk '{a[\$2]++}END{for(i in a){print a[i] \" \" i}}' | sort -rn | head"

alias xrdbr='xrdb -load ~/.Xresources'

# quick edit
alias e='$EDITOR'
alias se='sudo $EDITOR'
alias zshrc='$EDITOR ~/.zshrc'
alias zsh-custom='$EDITOR ~/.zsh-custom/custom.zsh'
alias xresources='$EDITOR ~/.Xresources'
alias xinitrc='$EDITOR ~/.xinitrc'
alias i3config='$EDITOR ~/.i3/config'
alias awesomerc='$EDITOR ~/.config/awesome/rc.lua'

# zsh is able to auto-do some kungfoo
# depends on the SUFFIX :)
if [ ${ZSH_VERSION//\./} -ge 420 ]; then
  # open browser on urls
  _browser_fts=(htm html de org net com at cx nl se dk dk php)
  for ft in $_browser_fts ; do alias -s $ft=$BROWSER ; done

  _editor_fts=(cpp cxx cc c hh h inl asc txt TXT tex)
  for ft in $_editor_fts ; do alias -s $ft=$EDITOR ; done

  _image_fts=(jpg jpeg png gif mng tiff tif xpm)
  for ft in $_image_fts ; do alias -s $ft=$XIVIEWER; done

  _media_fts=(ape avi flv mkv mov mp3 mpeg mpg ogg ogm rm wav webm)
  for ft in $_media_fts ; do alias -s $ft=$PLAYER ; done

  #read documents
  alias -s pdf=zathura
  alias -s ps=gv
  alias -s dvi=xdvi
  alias -s chm=xchm
  alias -s djvu=djview

  #list whats inside packed file
  alias -s zip='unzip -l'
  alias -s rar='unrar l'
  alias -s tar='tar tf'
  alias -s tar.gz='echo '
  alias -s ace='unace l'
fi

