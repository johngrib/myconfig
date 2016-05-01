#if [ -f ~/.bash_etc ]; then
#    . ~/.bash_etc
#fi

export HISTCONTROL=ignoredups
export HISTSIZE=1000

# aliases
alias l.='ls -d .* --color=auto'
alias ll='ls -al'

# colors
GREEN='\e[0;32m\]'
B_MAGENTA='\e[1;35m\]'
YELLOW='\e[0;33m\]'
COLOR_END='\[\033[0m\]'

# PROMPT
# PS1="\h:\W \u\$ "  # default promopt
PS1="${GREEN}\u ${B_MAGENTA}\h ${YELLOW}\w ${COLOR_END}\n\$ "
export PS1
