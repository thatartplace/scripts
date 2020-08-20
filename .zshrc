command_switch() {
	for s in "$@"; do
		c=("${(s/ /)s}")
		type "${c[1]}" &> /dev/null && {"${c[@]}"; break}
	done
}

short_hostname() {
	command_switch \
		"hostnamectl --transient" \
		"hostname -s"
}

setopt HIST_IGNORE_ALL_DUPS

() {
	local rc="$HOME/.zshrc.$(short_hostname)"
	[[ -r "$rc" ]] && . "$rc"
}

[[ ! -o interactive ]] && exit
#
# interactive only from here on
#

PS1="%B>%b %m %B>%b %~ %B%#%b "
RPS1="%(?..%F{red}[%?]%f)"

bindkey -v

autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
