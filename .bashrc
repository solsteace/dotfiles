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
gen_color() {
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
	if [ $(date +'%H') -gt 3 ] && [ $(date +'%H') -lt 16 ]
	then
		res+="$(gen_color ⡱⢎ 214)"
	else
		res+="$(gen_color ⢬⡷ 214)"
	fi
	echo -e $res
}

gen_user() {
	res="$(gen_color ▒▓ $2)"
	res+="$(gen_color " ▝▗▂▖▘ $USER " $1 $2)"
	res+="$(gen_color ▓▒ $2)"
	echo -e $res
}
 
# Execute this before every next prompt
# PROMPT_COMMAND="mytime=$(time_icon) && echo time is $mytime"

# Refer: https://www.gnu.org/software/bash/manual/bash.html#Controlling-the-Prompt
# For constant update, notice the '\' in $() syntax
PS1="$(gen_user 208 253)⡿⢯ \$(time_icon) \@⡽ \$ "

