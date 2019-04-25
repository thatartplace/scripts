case $- in
    *i*) ;;
      *) return;;
esac

[[ "$OSTYPE" == "darwin"* ]] && IS_MACOS=0
HOSTNAME_SHORT=$(hostname -s)

shopt -s cmdhist
HISTCONTROL=ignoreboth:erasedups

export PAGER=less
export EDITOR=vim
[[ "$IS_MACOS" ]] && export CLICOLOR=0

alias ls='ls -A'
alias grep='grep --color=auto'

umask 077

[[ -f "$HOME/.$HOSTNAME_SHORT" ]] && source "$HOME/.$HOSTNAME_SHORT"
