
export HISTCONTROL=ignoredups
export HISTSIZE=1000
alias l.='ls -d .* --color=auto'
alias ll='ls -al'

# PS1="\h:\W \u\$ "
PS1="\033[0;32m\]\u \033[1;35m\]\h \033[0;33m\]\w  \n\033[0;36m\]\$ \[\033[0m\]"
export PS1
