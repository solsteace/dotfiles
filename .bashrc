# .bashrc

# DEFAULTS =====================================================================
# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc


# Generate color
# Ref: https://gist.github.com/fnky/458719343aabd01cfb17a3a4f7296797
# Prompt overwriting troubleshoot: https://stackoverflow.com/questions/19092488/custom-bash-prompt-is-overwriting-itself
color() {
	res="\001\e["
	if [ $# -eq 2 ] # text only
	then
		res+="38;5;$2m"
	elif [ $# -eq 3 ] # with background
	then 
		res+="38;5;$2;"
		res+="48;5;$3m"
	fi
	res+="$1"
	res+="\e[0m\002"
	echo -e $res
}

# Display icon based on time
time_icon() {
	res=""
	if [ $(date +'%H') -gt 12 ] && [ $(date +'%H') -lt 24 ]
	then
		res="PM"
	else
		res="AM"
	fi
	echo -e $res
}

# Refer: https://www.gnu.org/software/bash/manual/bash.html#Controlling-the-Prompt
gen_PS1() {
	COL1=120
	COL2=17
	prompt=""

	prompt+="$(color "\uE0B6" $COL1)"
	prompt+="$(color "█" $COL1 $COL2)"
	prompt+="$(color '\u' $COL2 $COL1)"
	prompt+="$(color '██\uE0BC' $COL1 $COL2)"
	prompt+="$(color "   \@\$(time_icon)  " $COL1 $COL2)"
	prompt+="$(color "\uE0B0" $COL2)"
	prompt+="$(color " \W \$ " $COL1)"
	echo -e $prompt
}

# Execute this before every next prompt
# PROMPT_COMMAND="echo \n"
PS1="$(gen_PS1)"

# Aliases
alias zz=exit
alias tx="tmux -f ~/tmux.conf"
alias vi="nvim --clean"
alias nv="nvim"
alias nvx="nvim -u ~/.config/nvim/lua/lazyVim/init.lua"
