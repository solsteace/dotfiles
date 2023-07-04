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
color() {
	res="\e["
	if [ $# -eq 2 ] # text only
	then
		res+="38;5;$2m"
	elif [ $# -eq 3 ] # with background
	then 
		res+="38;5;$2;"
		res+="48;5;$3m"
	fi
	res+="$1"
	res+="\e[0m"
	echo $res
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

gen_user() {
	res="$(color "$USER "  $1 $2)"
	echo -e $res
}

gen_PS1() {
	# ║ ⢌⠔⡶⣌⠀⠀⣡⢶⠢⡡ ║
	# ║⠀⠀⠀⠑⠁⢄⡠⠈⠊⠀⠀⠀║
	# Refer: https://www.gnu.org/software/bash/manual/bash.html#Controlling-the-Prompt
	# For constant update, notice the '\' in $() syntax
	
	C0=123
	C1=75
	C2=238
	C3=236

	prompt="$(color "▓▒" $C0 $C0)"
	prompt+="$(gen_user $C3 $C0)"
	prompt+="$(color "▓" $C0 $C2)"
	prompt+="$(color "▓▒" $C1 $C2)"
	prompt+="$(color "▓▒" $C2 $C3)"
	prompt+="$(color " \@\$(time_icon) | \W " $C1 $C3)"
	prompt+="$(color " \$" $C1)"
	prompt+="⠀"
	echo -e $prompt
}

# Execute this before every next prompt
# PROMPT_COMMAND="echo \n"
PS1="$(gen_PS1)"

# Aliases
alias ZZ=exit
alias TX="tmux -f ~/tmux.conf"
